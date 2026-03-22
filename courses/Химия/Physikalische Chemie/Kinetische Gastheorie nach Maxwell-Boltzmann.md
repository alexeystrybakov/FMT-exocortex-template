---
tags:
  - Physikalische-Chemie
  - Thermodynamik
  - Kinetische-Gastheorie
  - Maxwell-Boltzmann
  - Geschwindigkeitsverteilung
  - Zusammenstoß
created: 2025-02-11T06:00
updated: 2025-02-15T06:09
---
## Wie beschreibt man ein Gas mikroskopisch?
Ausgangspunkt: ein Gas besteht aus vielen kleinen Massenpunkten, die keinerlei Wechselwirkung miteinander haben. Die Teilchen sind in ständiger Bewegung, stoßen miteinander zusammen und auch mit den Behälterwänden.
Mittlere **Translationsenergie** der Teilchen:
* im Raum (3 dim.): $\bar{E}_\text{trans}=\frac{3}{2} kT$
* in einer Richtung (1 dim.): $\bar{E}_\text{trans}=\frac{1}{2} kT$
Druck ist ein Maß für **Energiedichte**: $p=\frac{1}{3} \frac{N}{V} m \bar{v^2}$

>[!Beispiel] Beispiel: $\text{O}_2$ und $\text{H}_2$ 
>$\rho_{\text{O}_2} = 1,3 \: \text{g/L}$ und $\rho_{\text{H}_2} = 0,08 \: \text{g/L}$
>Bei gleicher Temperatur: $\bar{E}_{\text{trans,O}_2}=\bar{E}_{\text{trans,H}_2}=3,7 \: \text{kJ/mol}$
>Mit $\bar{E}_\text{trans}=\frac{3}{2} kT=\frac{1}{2} m \bar{v^2}$ und $\frac{\bar{v_1}}{\bar{v_2}}=\sqrt{\frac{M_2}{M_1}}$: $v_{\text{O}_2} = 444 \: \text{m/s}$ und $v_{\text{H}_2} = 1776 \: \text{m/s}$

### Geschwindigkeitsverteilung
**Maxwell-Boltzmann-Geschwindigkeitsverteilung**: $\frac{F(v)}{dv} = \frac{dN}{Ndv} = 4\pi (\frac{m}{2\pi kT})^{3/2} v^2 e^{-mv^2/2kT}$
![](<Images/Maxwell-Boltzmann-Geschwindigkeitsverteilung.png>)
y-Achse: $dN/Ndv$ - die Anzahl der Teilchen $dN/N$, die sich in einem Geschwindigkeitsuntervall $dv$ befinden.
**Maximale** Geschwindigkeit: $v_\text{m}=\sqrt{\frac{2RT}{M}}$ mit $\frac{R}{M}=\frac{k}{m}$
**Mittlere** Geschwindigkeit: $\bar{v}=\sqrt{\frac{8RT}{\pi M}}$
Geschwindigkeit der Teilchen, die genau mittlere Energie besitzen: $\sqrt{\bar{v^2}} = \sqrt{\frac{3RT}{M}}$
$\rightarrow$ $v_\text{m}<\bar{v}<\sqrt{\bar{v^2}}$
### Zusammenstoß
![](<Images/Zusammenstoss.png>)
**Stoßfrequenz eines Teilchens**: $z=\sqrt{2} \frac{N}{V} \sigma \bar{v}$
**Mittlere freie Weglänge**: $\bar{\lambda}=\frac{\bar{v}}{z}=\frac{1}{\sqrt{2} \frac{N}{V} \sigma}$ mit dem Idealgasgesetzt $\bar{\lambda}=\frac{kT}{\sqrt{2}p\sigma}$
**Anzahl der Wandstöße**: $z_\text{W} = \frac{1}{4} \frac{N}{V} \bar{v}$

>[!Beispiel] Beispiel:
> Mit $\sigma_\text{Ar}=0,36 \: \text{nm}^2$ und bei 298 K, 1 bar: $z_\text{Ar}=4,9 \times 10^9 \: \text{s}^{-1}$, $\bar{\lambda}_\text{Ar}=82 \: \text{nm}$, Abstand zwischen den Teilchen $\sqrt[3]{V/N}=3,5 \: \text{nm}$, $z_\text{W, Ar}=2,4 \times 10^{25} \: \text{m}^{-2} \text{s}^{-1}$

---
J.G. Lauth: https://youtu.be/jKF2ctBeFk8?list=PLMDopqQ3NXZuuiwTvr6Iql64SRenN_H60
