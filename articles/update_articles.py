#!/usr/bin/env python3
"""
ARTICLES.md auto-updater.
- Reads *.pdf in articles/ directory
- Derives short label (Author-Year) from filename (Author-Year-journal.pdf)
- Preserves existing rows by matching short labels
- Adds TODO placeholder rows for new PDFs not yet in ARTICLES.md
Run manually or automatically via git pre-commit hook.
"""

import os
import re

ARTICLES_DIR = os.path.dirname(os.path.abspath(__file__))
ARTICLES_FILE = os.path.join(ARTICLES_DIR, "ARTICLES.md")

HEADER = [
    "# Articles", "",
    "| Label | Authors | Year | Title | Journal | DOI | Keywords | Topic |",
    "|-------|---------|------|-------|---------|-----|----------|-------|",
]


def filename_to_label(filename):
    """Derive short label from PDF filename.
    'Kiefer-2025-jcp.pdf' -> 'Kiefer-2025'
    'Xiao-2018-nanolett-si.pdf' -> 'Xiao-2018'
    """
    name = filename.replace(".pdf", "")
    parts = name.split("-")
    # Label = first two components: Author + Year (4-digit number)
    label_parts = []
    for part in parts:
        label_parts.append(part)
        if re.match(r"^\d{4}$", part):
            break
    return "-".join(label_parts)


def get_pdfs():
    """Return list of (label, filename) for all PDFs, sorted by filename."""
    result = []
    for f in sorted(os.listdir(ARTICLES_DIR)):
        if f.endswith(".pdf"):
            label = filename_to_label(f)
            result.append((label, f))
    return result


def parse_existing_rows(filepath):
    """Return dict {label: row_string} from existing ARTICLES.md."""
    rows = {}
    if not os.path.exists(filepath):
        return rows
    with open(filepath, "r", encoding="utf-8") as f:
        for line in f:
            line = line.rstrip()
            if not line.startswith("|"):
                continue
            parts = line.split("|")
            if len(parts) < 2:
                continue
            cell = parts[1].strip()
            m = re.match(r"\[(.+?)\]", cell)
            if m and "Label" not in cell and "---" not in cell:
                rows[m.group(1)] = line
    return rows


def main():
    pdfs = get_pdfs()
    existing = parse_existing_rows(ARTICLES_FILE)

    lines = HEADER[:]
    seen_labels = set()
    new_count = 0

    for label, filename in pdfs:
        if label in seen_labels:
            continue  # skip duplicates (e.g. -si supporting info for same label)
        seen_labels.add(label)

        if label in existing:
            lines.append(existing[label])
        else:
            lines.append(f"| [{label}] | — | — | TODO: {filename} | TODO | — | — | — |")
            new_count += 1

    # Preserve rows whose PDFs were removed from disk (don't lose data)
    for label, row in existing.items():
        if label not in seen_labels:
            lines.append(row)

    with open(ARTICLES_FILE, "w", encoding="utf-8") as f:
        f.write("\n".join(lines) + "\n")

    total = len(seen_labels)
    print(f"ARTICLES.md updated: {total} articles total, {new_count} new placeholder(s) added")


if __name__ == "__main__":
    main()
