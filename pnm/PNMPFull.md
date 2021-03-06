**1 SCOPE **

**1.1 Introduction and Purpose **

As cable networks evolve, and many diverse services such as telephony, data,
video, business and advanced services (e.g., tele-medicine, remote education,
home monitoring) are carried over those networks, the demand for maintaining a
high level of reliability for services increases. To achieve such high
reliability, operators should fix problems before they have any impact on
service.

Some commonly tracked cable modem (CM) and cable modem termination system
(CMTS) metrics include CM status; upstream transmit level; CMTS upstream
receive level; upstream modulation error ratio (MER, also called upstream
signal-to-noise ratio or SNR); upstream codeword error ratio (CER); downstream
receive level; downstream MER/SNR; and downstream CER or bit error ratio
(BER). While these metrics are good indicators of the existence of problems,
they don’t always reveal the cause of those problems.

Increasingly, intelligent end devices are deployed in cable networks, and
termination devices and monitoring instruments are installed in headends (HEs)
and hubs. The new devices being deployed by operators, such as digital set-top
boxes (STBs), multimedia terminal adapters (MTAs) and embedded MTAs, hybrid
monitoring systems and even high end television sets are DOCSIS capable,
resulting in DOCSIS ubiquity. A conservative scenario in a serving area
assuming 60% penetration of STBs, 35% of CMs and 15% of eMTAs, all enabled
with DOCSIS, clearly highlights the trend towards DOCSIS ubiquity.

As DOCSIS devices evolve and are equipped with elaborate monitoring tools, it
becomes practical to use them for plant monitoring purposes. By using these
devices as network probes, cable operators can collect device and network
parameters. Combining the analysis of the data along with network topology and
device location, it is possible to isolate the source of a problem. A
proactive maintenance plan can be developed using this information.

This document describes guidelines and best practices for proactive network
maintenance mechanisms that rely on DOCSIS upstream pre-equalization
coefficients and spectrum capture. The processes described here will help
cable operators and industry vendors implement smart monitoring tools, improve
maintenance practices, gain better insight in network problems, and enhance
network reliability, among other things.

Even though the focus for the development of a proactive network maintenance
strategy is through the use of pre-equalization coefficients, the intent is
for this effort to expand in the future to include other plant metrics that
could help identify and resolve plant issues.

The key outcome of this effort is the reduction of troubleshooting and problem
resolution time thereby reducing operational costs. In addition, improvements
in network reliability enable the introduction of business and advanced
services that require SLAs (service level agreements) thereby generating new
revenue. This mechanism adds the capability to detect and resolve problems
before they impact customer service, which helps with churn reduction.

This V03 revision of the PNMP guidelines document was updated to include
DOCSIS 3.0 using Full Band Capture.

Even though the focus for the development of a proactive network maintenance
strategy is through the use of pre-equalization coefficients, the intent is
for this effort to expand in the future to include other plant metrics that
could help identify and resolve plant issues.

Valuable metrics that have been traditionally been used to assess performance
include, downstream and upstream SNR and MER, codeword error statistics as
well as transmit and receive levels. These metrics by themselves won’t
facilitate the location of the source of a plant problem. Nevertheless, when
these metrics are associated with equalizer responses and spectrum captures,
the value of these metrics increases as they provide additional evidence to
the existence of a problem.

The key outcome of this effort is the reduction of troubleshooting and problem
resolution time, thereby reducing operational costs. In addition, improvements
in network reliability enable the introduction of business and advanced
services that require SLAs (service level agreements) thereby generating new
revenue. This mechanism adds the capability to detect and resolve problems
before they impact customer service, which helps with churn reduction.

**1.2 PNM Background and History **

The eight or so traditional DOCSIS service indicators that operators have
relied upon for years are CM status, upstream transmit level, upstream receive
level, upstream SNR (MER), upstream codeword error rate, downstream receive
level, downstream SNR (MER), and DS codeword error rate. One question that
arises is why additional information is needed? The answer is that these
indicators, while valuable, are poor at answering the question “exactly what’s
wrong” or “what is the root cause of poor service”. On the other hand,
upstream equalization and full band capture data speak much more clearly as to
root causes, although some interpretation skill is still needed. That is one
of the reasons for this document.

Most RF communication systems, including DOCSIS systems, use a variety of
techniques to adjust and compensate for variations in time, frequency,
transmit power level, and for linear distortion. It has been recognized for
quite some time that useful plant health information can be derived from the
parameters that describe the compensation and adjustments that take place.
This network monitoring advantage is enhanced by the ubiquity of DOCSIS
devices operating as network probes across the entire HFC footprint.

Some device parameters that provide significant insight into the
characteristics of the DOCSIS upstream transmission channel are the pre-
equalization coefficients. Pre-equalization techniques are used to compensate
for linear distortion in the upstream channel. Examples of linear distortions
include micro- reflections, amplitude ripple, tilt, and group delay
distortion. In most cases pre-equalization is able to completely compensate
for linear distortion problems without having the customer perceive an impact
on performance. This provides the operator time to fix the problem before any
service degradation has taken place thereby facilitating a proactive network
maintenance strategy.

In the cable domain, pre-standard data-over-cable system vendor, LANcity had
equalization functionality in some of its products. Nevertheless, this
proprietary protocol feature was not leveraged as the cable industry
transitioned to the standard DOCSIS technology.

Even though in DOCSIS systems, pre-equalization has been mandatory since the
DOCSIS 1.1 specification version, pre-equalization data was only used starting
half-way through the deployment of DOCSIS 2.0 compliant devices around 2005.
DOCSIS systems have a variety of channel width and modulation order
configuration options. Operators’ earlier use of narrower bandwidth channels
(predominantly 1.6 MHz) and lower order modulations (e.g., QPSK) did not
require the use of pre-equalization. Moreover, some operators were reluctant
to turn on pre-equalization due to a history of certain DOCSIS 1.0 CMs
misbehaving when pre-equalization was turned on. The need to turn pre-
equalization on became apparent in scenarios when increased upstream peak
rates and transport robustness were needed. Demand for higher peak rates and
higher capacity lead to the migration to 3.2 MHz and 6.4 MHz bandwidth
channels and the use of higher order modulations such as 64-QAM.

Pre-equalization in DOCSIS 1.0 was optional and was left unspecified. Pre-
equalization in DOCSIS 1.1 was not only defined accurately but was also
mandatory for channels up to 3.2 MHz. The mandatory nature of Pre-equalization
in DOCSIS 1.1 and proper identification and isolation of misbehaving CMs
enabled cable operators to turn on pre-equalization.

A couple of years later, after the DOCSIS 2.0 specification was released, pre-
equalization MIBs became also available. This event made possible the use of
pre-equalization information for network management purposes.

Earlier work by Holtzman, Inc., Motorola, and CableLabs highlighted the value
for understanding linear distortions, additive impairments, and their impact
on service performance.

In 2005, CableLabs and Charter Communications collected pre-equalization data
from multiple nodes in Estes Park, Colorado. Only a portion of the data
collected was easily readable but subsets of that data exhibited an apparent
correlation. This was the start of the equalization coefficient decoding and
normalization effort. Cable operators could now begin to make sense of
distortion signatures and how they relate to problems in the field.

The use of DOCSIS pre-equalization coefficients along with plant topology
information to pinpoint problems in the network were described in a series of
CableLabs internal reports in 2006 and at the SCTE Cable-Tec Expo 2008 in
Philadelphia [1]. This proposed approach relied on the following steps:

1) Derivation of frequency response signatures from pre-equalization
coefficients

2) Identification and grouping of linear distortions from the frequency
response data 3) Correlation of impacted CMs with topology information to
locate the cause of the problem.

A CableLabs-sponsored Proactive Network Maintenance (PNM) working group was
formed in 2009 to leverage information obtained from DOCSIS devices and to
troubleshoot the plant. This group comprised cable operators, CableLabs, and
silicon, CM, CMTS, and instrumentation vendors. Tasks of the PNM working group
included the development of techniques to relate pre-equalization signatures
to problems in the field. PNM working group participation by the North
American cable operator Comcast not only facilitated the use of large amounts
of field data to understand pre-equalization coefficient information, but also
provided valuable field information of what impairment was associated with
what distortion signature. One key output of the PNM working group was the
Best Practices and Guidelines Document of Proactive Network Maintenance Using
Pre-Equalization [2] published in 2010.

The original PNM working group output also lead to operator implementations of
PNM based tools. The first implementation of an operator-developed pre-
equalization analysis tool was the Scout Flux tool from Comcast. This tool was
implemented and released in 2009. Comcast’s technical workforce played an
integral role in determining a variety of plant impairment scenarios and their
signatures. Charter’s Node Slayer PNM tool followed as well as tools from
other cable operators.

Although the PNM working group initially focused on upstream pre-equalization,
other topics were also discussed. These topics included downstream
equalization, which still suffers from lack of compliance and discrepancies in
MIB interpretation. Upstream spectrum analysis, required in DOCSIS 3.0 for a
single channel but supported in a proprietary fashion by numerous CMTS vendors
across the full upstream spectrum was also discussed. Cisco Systems lead
efforts assessing the impact that LTE ingress has on performance. The
introduction in DOCSIS 3.0 of multiple bonded channels resulted in high
sampling rate receiver implementations. Industry leaders such as Broadcom
leverage CPE spectrum capture or full band capture (FBC)1 from this feature
and Comcast introduced it into their network management systems shortly after
its availability.

FBC enabled operators to have spectrum analysis capabilities wherever modern
DOCSIS 3.0 CMs have been deployed. This enables operators to take remote
spectrum captures at the customer premises without having to carry an
expensive spectrum analyzer and without requiring access into a subscriber’s
home. FBC resulted in significant operational advantages not to mention
operational cost savings. With an increasing number of DOCSIS 3.0 CMs being
deployed, these spectrum analysis probes have gathered critical mass and are
able to correlate spectrum signatures from neighboring CMs to troubleshoot and
locate problems. The width of the spectrum (full band) has allowed operators
to detect very short micro- reflections not visible when a single channel is
analyzed through equalization. FBC also has enabled verification of channel
level alignment and the detection of ingress. Correlation of CM signatures
before and after actives enables the detection of nonlinear problems at
amplifiers. Automated spectrum signature analysis and impairment detection are
being implemented to scale the analysis to the millions of CMs deployed with
this functionality.

An extended capability of FBC is upstream spectrum capture at the CM. Although
the lower frequency upstream signals are attenuated at the downstream receiver
port by the diplex filter, in many cases enough energy passes through to allow
for the detection of impulse noise at the customer premises. This is a very
promising technique that can be enhanced through CM design, including, for
example, diplex filter bypass.

More recently, leveraging field data collected at Comcast, Armstrong Cable,
and Suddenlink Communications, CableLabs has demonstrated the correlation
between equalization coefficient variability and MER variation with impulse
noise. This has opened the door to solving ingress localization problems for
certain types of noise. Ingress localization is one of the remaining
challenges to conquer in HFC plant troubleshooting.

The work of the PNM working group has been crucial in the incorporation of PNM
tools into the DOCSIS 3.1 specification. Under the leadership of Broadcom,
DOCSIS 3.1 incorporated hooks in the specification that allow systems to
emulate spectrum analyzers, vector network analyzers, vector signal analyzers,
and other tools.

After five years since the initial PNM document’s publication, an updated
version is intended through this document. Different innovations in the area
of proactive network maintenance have been discussed but not recorded. It is
the goal of this document to incorporate all the relevant topics in the area
of PNM since that last publication.

**2 REFERENCES ****2.1 Informative References **

[DOCSIS OSSIv2.0] [DOCSIS OSSIv3.0] [DOCSIS PHYv3.0] [DOCSIS RFIv2.0]
[RFC4546]

Operations Support System Interface Specification, CM-SP-OSSIv2.0-C01-081104,
November 4, 2008, Cable Television Laboratories, Inc.

Operations Support System Interface Specification, CM-SP-OSSIv3.0-I28-151210,
December 10, 2015, Cable Television Laboratories, Inc.

Physical Layer Specification, CM-SP-PHYv3.0-I12-150305, March 5, 2015, Cable
Television Laboratories, Inc.

Radio Frequency Interface Specification, CM-SP-RFIv2.0-C02-090422, April 22,
2009, Cable Television Laboratories, Inc.

IETF RFC 4546, Radio Frequency (RF) Interface Management Information Base for
Data over Cable Service Interface Specifications (DOCSIS) 2.0 Compliant RF
Interfaces, June 2006.

**2.2 Reference Acquisition **

Cable Television Laboratories, Inc., 858 Coal Creek Circle, Louisville, CO
80027; Phone +1-303-661-9100; Fax +1-303-661-9199; http://www.cablelabs.com

**3 TERMS AND DEFINITIONS **

**4 ABBREVIATIONS AND ACRONYMS **

**5 PNM USING UPSTREAM EQUALIZATION **

**5.1 Reactive versus Proactive Network Maintenance **

In this document, the definition of reactive network maintenance is a
stringent one and, in the era of multimedia, business and advanced services,
is perhaps one that the cable industry should follow. Reactive network
maintenance consists of network maintenance practices that are initiated by
metrics which show service performance has been impacted. Under this
definition, it is not assumed the need of customer feedback/calls for network
maintenance to be reactive. As long as conditions such as FEC statistics,
power starvation, CPD, narrowband interferers, laser clipping, impulse noise
and other service impacting symptoms are detected, the response to such is
reactive. In the case of distortion that is completely corrected by pre-
equalization there is no performance impact, therefore maintenance actions
that arise from these impairment discoveries are considered to be proactive.
If there are symptoms that combine performance impacting conditions with
distortion detected through equalization, the maintenance that arises from it
is still considered reactive.

Impairments that result in network maintenance classified as reactive would
likely be given higher priority for resolution because they are already
impacting performance.

In most scenarios, upstream pre-equalization mechanisms can completely
compensate for certain problems in the network and no symptoms are detected in
FEC statistics or through other metrics. The fact that equalization can fully
compensate for network linear distortion can buy the operator time in
resolving the issue before there is service impact, thus enabling a proactive
network maintenance strategy.

**5.2 Linear Impairments **

In the upstream portion of the CATV network there are different types of
impairments. These can be classified based on the impact these impairments
have on the signal as linear as well as nonlinear impairments. In the case of
a “linear” impairment, the impact on the signal will be given by a change in
amplitude and phase of the original signal. In the case of a “nonlinear
impairment“, the signal generates distortion components, including harmonics
of the original signal or multiplies the original signal with other energy
present in the return band. For example, in the linear distortion case,
transmitting information across the upstream channel will result in an
amplitude and phase deviation for a given frequency point. A micro-reflection,
which is analogous to a wireless multipath signal, could result from the
bouncing back and forth of a signal between two interfaces that have impedance
mismatches, generating an amplitude and phase distortion of the signal as
summation of a time-delayed signal copy- the reflection or echo-combined with
the desired signal. A second example of a linear distortion occurs at the
diplex filter rolloff that marks the upper edge of the upstream frequency
spectrum around 42 MHz. At this rolloff frequency, the amplitude and the phase
suffer considerable distortion. In particular, the phase distortion is
noticeable prior to reaching the band-edge. This phase distortion is more
easily shown when expressed as group delay which is defined as:

_GroupDelay _= − _d_φ _d_ω

whereφ is the phase in radians, ω is the frequency in radians per second, and
group delay is in seconds. Group delay is ideally constant across the band of
interest. Group delay variation across the band is known

as group delay distortion. Additional discussion about linear impairments can
be found in the tutorial material in Appendix I.

One thing to keep in mind is that even impairments that are considered
“nonlinear” such as common path distortion (CPD) may have associated linear
distortion elements. For instance, the corrosion of a center conductor that
generates a mixer effect also results in an impedance mismatch that can
generate a noticeable micro-reflection.

Examples of impairments that are nonlinear include the previously mentioned
CPD, as well as composite second order (CSO) and composite triple beat (CTB)
distortions, cross-modulation, and laser clipping. Ingress and impulse noise
are considered additive impairments, although if an impairment such as impulse
noise is high enough to cause laser clipping, it can be considered nonlinear
in nature too.

**5.2.1 Micro-reflection Types **

The following sections describe multiple scenarios in which micro-reflections
may be generated within the HFC network. Micro-reflection Example 1 describes
a case where there are HFC components whose low return loss (R) values are
contributing to the micro-reflection source. Micro-reflection Example 2
describes a case where an HFC component whose isolation performance and an
impedance mismatch are contributing to the micro-reflection source. Lastly,
micro-reflection Example 3 describes a case where the micro-reflection
impairments represent a combination of the two previous cases. Micro-
reflection sources are not limited to the examples presented here. For more
information about micro-reflections, refer to the tutorial section of this
document.

**_5.2.1.1 Micro-reflection Example 1 _**

This type of commonly experienced micro-reflection is exhibited when the
upstream signal encounters impedance mismatches somewhere in its upstream path
to the CMTS, causing redirection of a fraction of the signal’s energy back
towards the CM. Once the redirected signal becomes incident on another
impedance mismatch, it is then directed back toward the CMTS. Figure 1
illustrates an upstream signal, labeled Upstream Signal #2, on the cable
originating between two reflection points, Γ1, and Γ2. However, the upstream
signal may originate anywhere downstream from the first reflection point, Γ1,
illustrated in Figure 1 as Upstream Signal #1. The majority of the upstream
signal passes through the impedance mismatch and continues toward the CMTS and
is labeled Main Signal in the figure. A fraction of the upstream signal is
reflected back towards the signal source at Γ1. This reflected signal
encounters a second reflection point, Γ2 which reflects a fraction of the
reflected signal energy back into the direction of the original signal,
represented as Reflected Signal in Figure 1.

This general case describes the signal passing through two reflectors, neither
of which is the CM itself. One technique to determine whether the CM is one of
the reflectors is to add a 3 dB inline attenuator at the CM port (upstream
output). If the micro-reflection magnitude is lessened by 6 dB or more,
because of the reflected signal passing through the attenuator twice, then the
CM is indeed one of the reflectors. If there is no significant change in
micro-reflection magnitude, then the pair of reflectors lies remote to the CM
location. This technique of adding attenuation would work equally well to
isolate reflections elsewhere in the network, but it is much more difficult to
install attenuation between line passives.

The reflected signal from Γ2 proceeds upstream and again encounters the
reflection point Γ1. This causes yet another reflection back downstream, and
the process repeats endlessly. (It is analogous to looking at one’s reflection
in a mirror, when there is another mirror behind. There will be an endless
sequence of images, each one progressively smaller.) Each passage between Γ1
and Γ2 is called a transit. The main micro-reflection echo results from the
triple transit, up/down/up. The next echo is from the 5th-order transit
up/down/up/down/up, and so on. This type of response, which goes on forever,
is called infinite impulse response (IIR). It consists of a geometric series
of echoes, separated by equal delays (equal to twice the propagation delay
between the points Γ1 and Γ2), with each echo value smaller than the last (by
the same ratio Γ1 Γ2 or, dB difference 10 log Γ1 \+ 10 log Γ2). The decaying
micro-reflections may quickly be lost in the noise floor after two or three
trips through the micro-reflection source.

Conversely, the adaptive equalizer response, which is approximately the
inverse of the channel response, will have only a single tap after the main
tap for this case.

Though the reflector examples in Figure 1 are feeder taps, it should be noted
that many devices can produce similar results, including damaged cables or
corroded splices, which are often causes of micro- reflections as well.

Note that the delay between echoes equals twice the propagation delay between
the two reflection points Γ1 and Γ2, so the distance between the two
reflectors is known. However it does not relate how far along the plant these
two reflectors are, that is, the location of the impairment in the plant. To
determine the location of the fault, additional information is necessary as
described in Section 6.6, Fault Localization.

![](PNMPFull.files/image002.png)



**_5.2.1.2Micro-reflection Example 2 _**

The second type of micro-reflection may occur anywhere in the network, but its
magnitude is most noticeable in CMs located off the highest value feeder taps.
Figure 2 describes the upstream signal flow from a CM sending its upstream
signal into the port of the 23 dB feeder tap. The intent of the plant design
is that the primary path of upstream signal flow is toward the left of the
page, toward the CMTS. Some signal energy may be reflected from the amplifier
to the left of the 23 dB feeder tap, but this energy is usually insignificant
because of good impedance matching of the amplifier.

The 23 dB feeder tap is a combination directional coupler and splitter meaning
it directs the upstream signal in the upstream direction. The directivity of
the feeder tap is not perfect. Some of the energy from the CM may be leaked
towards the output connector. This is a function of the isolation of the
feeder tap. Isolation is specified with all ports terminated, and cable
industry field practice has often not adhered to terminating unused feeder tap
ports. In addition, corrosion of the feeder tap can degrade its isolation
performance.

If a 23 dB feeder tap has a tap-port-to-output-port isolation of only 38 dB,
there would be two signal paths created, one with 23 dB attenuation, and one
additional signal going the other direction with only 38 dB attenuation. If
this additional signal meets a reflector downstream from the 23 feeder tap,
the additional signal will be reflected back in the direction of the upstream
signal and will be combined with the main signal at the 23 dB feeder tap where
it originated. This micro-reflection is easily observed in cases where there
is long un-tapped span of cable between the first feeder tap, the 23 dB feeder
tap in this case, and low-value feeder taps with open terminations. All of
these unterminated feeder tap ports create their own micro-reflections. This
condition usually creates multiple micro-reflections, and since there was an
open port at the 11 dB feeder tap and another at the 8 dB feeder tap, there
would be two different cable lengths resulting in two different micro-
reflection delay characteristics.

This case is important to mention since the reflector, Γ1, is not in the tree
of the devices between the CM and the CMTS, but includes devices that are
downstream from the CM feeder tap location. This phenomenon, as mentioned
earlier, is more noticeable at the high value feeder tap, because as the
feeder tap value decreases, the amplitude difference between the desired
signal and the micro-reflection increases. If both the 23 dB feeder tap and
the 11 dB feeder tap had 35 dB tap-port-to-output-port isolation, there would
be 12 dB greater separation between desired and the micro-reflection signal.
Additionally, the 23 dB feeder tap location is near the amplifier followed by
a long length of cable, where the 11 dB feeder tap is found near the end of
the cable so the cable length for the 11 dB feeder tap is shorter and the
micro-reflection delay characteristic is correspondingly less.

This type of micro-reflection does not exhibit an unending IIR response, since
the reflected energy from Tap 8 passes through Tap 23 relatively unimpeded and
continues upstream. This type of response, which stops after a single echo, is
called finite impulse response (FIR). The signature will show a single main
echo without trailing echoes.

Conversely, the adaptive equalizer response, which is approximately the
inverse of the channel response, will have a sequence of smaller and smaller
taps for this case. This is because the equalizer internally generates
additional echoes as it cancels the original echo in the signal. As it
generates an echo, it must use another tap to cancel the new echo. This
process goes on until the end of the equalizer tapped delay line is reached.
Any remaining echo energy is uncompensated after this point, and results in
reduced RxMER.

To summarize, a multiple-transit echo scenario (Example 1) has an unending
sequence of decaying echoes in the channel response, and the corresponding
adaptive equalizer response has a single echo. A single- reflection scenario
(Example 2) has a single echo in its channel response, and the corresponding
adaptive equalizer response has a decaying sequence of echoes continuing to
the end of the equalizer tapped delay line.

![](PNMPFull.files/image004.png)

**_5.2.1.3 Micro-reflection Example 3 _**

Figure 3 represents a case that is a superposition of the previous cases
described in Micro-reflection Example 1 and Micro-reflection Example 2. A
reflective point exists if the amplifier has poor return loss. A fraction of
the desired signal is reflected off the output of the amplifier, Γ1, and
propagates downstream to the open connection at the end-of-line or an open
feeder tap port, Γ2, where it reverses direction back towards the amplifier
and rejoins the original signal at the feeder tap location.

If the amplifier and feeder tap are co-located or are very close together,
there will little difference in micro-reflection delay characteristic between
the previously described Micro-reflection Example 1 and Micro-reflection
Example 2. In fact, they may add or cancel each other out.

However, if the amplifier is a pole span or more away from the feeder tap,
there may be two different distinct micro-reflections created for the single
unterminated feeder tap. These micro-reflections are usually low in magnitude;
30 dB or more lower than the incident signal, but they can be numerous in a
single amplifier-to-termination span.

It is conceivable that multiple micro-reflections may emanate from successive
multiple passes through HFC components comprising the micro-reflection source.
Cases in which only a single micro-reflection exists may be limited to
laboratory simulation of the micro-reflection impairment and may not be
practically encountered within the HFC network.

The cable industry has favored “capping” unused feeder tap ports rather than
terminating the ports. Some operators will defend that position because it is
claimed to reduce potential ingress sources. Indeed it is a tradeoff between
craft integrity and good impedance matching practices, which causes more
stress on the upstream adaptive equalizer.

**_5.2.1.4 Micro-Reflection Example 4 _**

Figure 4 shows a single reflection that travels from the large “X” in the
figure toward the source (the tap or some other device beyond the left edge of
the figure), which is assumed to have high return loss, resulting in a very
low amplitude re-reflection toward the original point of reflection. The
interaction of the incident and reflected energy produces standing waves
(amplitude ripple). However, the net effect is that the CM sees a flat
frequency response on the downstream and the CMTS sees a flat upstream
frequency response. Unfortunately, some energy is lost so receive signal
levels will be low. (Note: lost RF energy sometimes indicates signal leakage.)
As anticipated, this type of impairment is difficult to detect. One method of
detecting this problem is via a standing wave measurement in the field, which
requires probing the line with a high impedance probe, such as a Trilithic®
I-Stop, as illustrated in Figure 4. Note that if a system has an echo tunnel
caused by two plant defects, repairing one of the defects will cause the echo
tunnel to disappear, but the other defect remains. See Appendix VIII for a
discussion of this type of detection.

![](PNMPFull.files/image006.png)

![](PNMPFull.files/image008.png)

**5.3 Pre-equalization Mechanism Enabled through DOCSIS Ranging **

The upstream pre-equalization mechanism relies on the interactions of the
DOCSIS ranging process in order to determine and adjust the CM pre-
equalization coefficients. The intent is for the CM to use its

coefficients to predistort the upstream signal such that the predistortion
equals the approximate inverse of the upstream path distortion, so that as the
predistorted upstream signal travels through the network it is corrected and
arrives free of distortion at the upstream receiver at the CMTS.

The pre-equalization coefficients of the CM are the complex coefficients (F1
through F24) of the 24-tap linear transversal filter structure shown in Figure
5\.

![](PNMPFull.files/image010.png)

In this structure the blocks with z-1 label represents delay elements, each of
which in the DOCSIS 2.0 pre- equalizer is the symbol period T (in DOCSIS 1.1
it can also represent delays equal to T/2 and T/4).

In the ranging process the CM sends a ranging request message (RNG-REQ) to the
CMTS. The CMTS may use a known portion of this message, such as the preamble,
as well as other known messages to determine the quality of the received
signal, as well as to determine the adjustment the CM should make to its pre-
equalization coefficients to better compensate the upstream distortion. In
response to the RNG- REQ message, the CMTS sends a ranging response (RNG-RSP)
message with a set of 24 coefficients and a parameter that indicates whether
these coefficients are intended to result in a set or adjust operation by the
CM. In the case of a set command, the CM will replace its existing
coefficients with the ones sent by the CMTS. In the case of an adjust command,
the CM convolves its coefficients with the ones sent by the CMTS to achieve
the adjusted coefficients (Figure 6).

![](PNMPFull.files/image012.png)

The CMTS may not be completely satisfied with the quality of the signal the CM
is sending after the initial try. This is an iterative process which may take
a few interactions before the coefficients are stable.

CMTS implementations use for the most part the transmit-equalization-adjust
option to convey information. Only after the initial ranging request, one may
see a CMTS send a transmit-equalization-set message to make sure that the CM
initializes properly. In principle the CMTS could use this message when it
needs to reset the coefficients.

A CMTS that is completely satisfied with the values of the pre-equalization
coefficients sends an adjust message where all coefficients are zero except
for the pre-equalizer’s main tap coefficients, which has maximum or nominal
value. This represents a Kronecker delta or impulse function, and any data set
convolved with an impulse results in the original data set, which in this case
is the CM pre-equalization coefficients, unchanged.

**5.3.1 Pre-equalization Enabling Messages **

As described previously, the two messages that are key in the ranging process
are the range response (RNG-RSP) and range request (RNG-REQ) messages. The
RNG-RSP message, which is generated by the CMTS in response to a RNG-REQ
message, carries timing, frequency, power level, and equalization adjustment
information as well as equalization set or load information and ranging
status. This information is encoded following what is known as type-length-
value (TLV) format. DOCSIS 1.1 pre- equalization coefficients are identified
by type 04 and DOCSIS 2.0 or 3.0 by type 09. The RNG-RSP messages that the
RNG-REQ messages correspond to are linked by the service ID or SID. SIDs
identify upstream service flows. It may be that a CM has several SIDs. In that
case a CM will get ranging information through each of the SIDs it has. For
example, if a CM has a SID that is used for telephony service and one that is
used for data service, there will be two parallel ranging processes within a
single CM. In addition to the SID, the RNG-RSP message payload also carries
the upstream channel ID. Figure 7 shows the structure of the RNG-RSP message.

![](PNMPFull.files/image014.png)

The RNG-REQ message is generated by the CM and sent to the CMTS. The RNG-REQ
is used as the reference to determine whether the CM signal needs any
adjustment. These adjustments could be in frequency, power level, timing
offset, and distortion. Once the CMTS receives the RNG-REQ message it uses a
known portion of this message as the reference of what the signal should look
like. Typically that known portion of the message is the preamble. If the CM
is not finished implementing the changes the CMTS is asking for, the CM
includes in the RNG-REQ message a ranging status indicating whether or not the
ranging changes are still pending. This is the “pending till complete” field
in the RNG-REQ message payload. The RNG-REQ message also carries a downstream
channel ID that associates the upstream being used with a downstream channel.
Figure 8 shows the structure of the RNG-REQ message.

![](PNMPFull.files/image016.png)

**5.3.2 CM and CMTS Equalization Information **

The pre-equalization coefficients are loaded into the adaptive pre-equalizer
in the CM, which is used to compensate for upstream linear distortion(s).
Hence the CM pre-equalization data indirectly describes the distortion in the
plant for which it compensates. The pre-equalizer response is approximately
the inverse or opposite response of the plant. The pre-equalization
coefficients provide detailed characteristics of the channel distortion,
although the coefficients do not directly indicate the level of micro-
reflections. Assuming negligible group delay distortion and a single micro-
reflection, a quick estimate of micro- reflection level can sometimes be
obtained using the energy in the adaptive equalizer’s non-main taps. In
general, an elaborate analysis is required to uniquely resolve micro-
reflection level/delay signature characteristics. An upstream channel that
exhibits no distortion has all the energy concentrated in the adaptive
equalizer main tap while one that exhibits distortion also has energy in taps
other than the main tap (Figure 9).

![](PNMPFull.files/image018.png)



The pre-equalization data which the CMTS continues to send to the CM indicates
how successful a CM has been in compensating for the distortion by showing
what is left to compensate to achieve ideal reception. Ideally and typically,
the CM starts with no compensation and after a few ranging intervals, achieves
a steady state where the CM compensates for all the distortion. At that point
the CMTS pre-equalization data exhibits a flat response indicating that
further compensation is not required (Figure 10).

![](PNMPFull.files/image020.png)

The upstream CM equalization data collected by the CMTS is analyzed to verify
that any plant distortion has been compensated. There is the possibility of a
distortion being so severe (e.g., a micro-reflection having a very long delay)
that the pre-equalization process would not be able to fully compensate for
it. These scenarios are rare in current HFC architectures, but if this does
occur, one must be aware that an impairment identification process using only
CM pre-equalization data will not yield accurate results.

**5.4 Upstream Pre-equalization in DOCSIS 1.0, DOCSIS 1.1 and DOCSIS 2.0 **

Upstream pre-equalization in DOCSIS 1.0 was left as optional and the
equalization process between CMTS and CM was not defined in sufficient detail.
An unexpected result occurred when DOCSIS 1.1 and 2.0 were introduced with a
well-defined process. A few 1.0 CMs that implemented pre-equalization
exhibited erratic behavior in the presence of downstream RNG-RSP messages that
were generated by 1.1 or 2.0 CMTSs. For quite some time operators have not
been motivated to turn pre-equalization on, in part because the demand for
capacity and spectrum availability have not been significant enough to warrant
the use of wider channels, higher order modulations, or frequencies near the
edges of the upstream spectrum where linear distortion occurs.

Some 1.0 CMs exhibiting the problem have been successfully upgraded with
firmware that corrects this issue. Unfortunately it has not been possible to
correct this issue on all affected CMs. To support reliable use of upstream
pre-equalization, operators have been replacing 1.0 CMs having known issues.

**5.4.1 DOCSIS 1.1 Pre-equalization Considerations **

The percentage of DOCSIS 1.1 CMs deployed is still significant enough not to
take advantage of the pre- equalization compensation. Nevertheless, based on
the percentage of 1.1 CM population and the rate at which 1.1 CM versions are
decreasing with time, it is important to determine at what point the
procedures described in this documentation will be worthwhile to implement.

**5.5 Limitations on Pre-equalization Compensation **

In a scenario of an upstream path that exhibits a micro-reflection, the
maximum delay compensation that can be achieved using pre-equalization is
limited by the amount of delay that can be generated within the pre-
equalization filter structure shown in Figure 5. The maximum delay that can be
generated is given by the delay between the adaptive equalizer’s main tap and
the last adaptive equalizer tap.

In DOCSIS 2.0 and 3.0, the delay or spacing between each adaptive equalizer
tap location is equal to the symbol period, because it always has a parameter
of adaptive equalizer taps/symbol equal to 1. Typical implementations in
DOCSIS 2.0 and 3.0 have the main equalizer tap in the eighth position out of a
24-tap delay line. Therefore the maximum delay that can be generated in that
filter structure is 16T (last tap position - main tap position) where T equals
the symbol period.

In DOCSIS 1.1 the delay between different adaptive equalizer tap locations can
be a fraction of a symbol period. That is, the number of equalizer taps/symbol
parameter is allowed to be 1, 2 or 4, resulting respectively in delay
differences between adaptive equalizer tap locations of T, T/2 and T/4. This
option has not been implemented in a CMTS. Therefore, in DOCSIS 1.1 CMTS
scenarios, the maximum delay that can be generated is equal to 4T (last tap
position - main tap position). Table 1 shows the maximum delays that are
generated in DOCSIS 1.1 and 2.0 or 3.0 filter structures at different symbol
rates using the typical equalizer main tap configurations (position 4 for
DOCSIS 1.1 and position 8 for DOCSIS 2.0 and 3.0).

![](PNMPFull.files/image022.png)

It cannot be assumed that a DOCSIS 2.0 filter structure can fully compensate
for a micro-reflection with a delay of 3.125 microseconds. Typically energy in
the neighboring equalizer taps help in the fine tuning of that compensation
and a micro-reflection that pushes the delay to the limit of the equalizer
won’t have longer delay equalizer taps available to help in the representation
of the exact value. This is especially true if the echo delay is not a
multiple of the symbol period, since the equalizer taps are then not spaced at
the exact intervals to efficiently cancel the echo, and more equalizer taps
are needed to provide effective cancellation. This will impact more severely
higher order modulation scenarios such as 64-QAM where the adjustment is more
critical.

In addition, in the case of strong micro-reflections, the equalizer may have a
decaying sequence of taps as described in Example 2. For proper cancellation
of the echo, taps at 2 or 3 times the echo delay may be needed. This implies
that the echo must be 2 or 3 times shorter than the equalizer length.

Here are some examples of a few micro-reflection scenarios in potential HFC
plant configurations. The first scenario is a micro-reflection that occurs
between an amplifier and a feeder tap that are separated by 75 feet (150 feet
round trip distance) and that have a return loss of 6 dB on each reflection
interface (interface where impedance mismatch occurred). The feeder cable
between these interfaces has a diameter of 0.625” and an attenuation of 1.2
dB/300 feet. This is considered a strong and short micro- reflection. Figure
11 shows the level and delay of the third transit and its subsequent multiple
transit echoes.

The second scenario is a micro-reflection that occurs between two amplifiers
and there are no feeder taps in between. They are separated by 1200 feet (2400
feet round trip distance) and that have a return loss of 8 dB on each
reflection interface (interface where impedance mismatch occurred). The feeder
cable between these interfaces has a diameter of 1.000” and an attenuation of
0.8 dB/300 feet. This is considered a strong and long-delay micro-reflection.
Figure 11 shows the level and delay of the third transit echo (top large blue
square). The fifth transit echo of this micro-reflection is too low in
amplitude to be noticeable.

The third scenario is a micro-reflection that occurs between two amplifiers
and with feeder taps in between. The amplifiers are separated by 1200 feet
(2400 feet round trip distance) and each has a return loss of 8 dB on each
reflection interface (interface where impedance mismatch occurred). The
aggregate insertion loss (also called through loss) in the feeder taps is
equal to 6 dB (12 dB round trip). The feeder cable between the interfaces has
a diameter of 1.000” and an attenuation of 0.8 dB/300 feet. This is considered
a mild and long-delay micro-reflection. Figure 11 shows the level and delay of
the third transit echo. The fifth transit echo of this micro-reflection is too
low in amplitude to be noticeable.

Figure 11 also indicates which scenarios can be compensated in the different
DOCSIS configurations. The scenarios that lie to the left of the vertical line
that corresponds to a given channel width /DOCSIS mode combination can be
compensated, while the ones that lie to the right of the line cannot be
properly compensated. It is also worth noting that in cases close to the
vertical line, higher order modulation may not be possible.

![](PNMPFull.files/image024.png)

**_Figure 11 - Pre-equalization Compensation Capabilities under Short and Long Delay Micro-reflection Scenarios _**

The examples just discussed assumed 0.625” cable for the short time delay
reflection and 1” cable for the long time delay reflection. The short time
delay reflection scenario includes data points at 150’, 300’, and 600’ round
trip distances and the long time delay reflection includes data points at
2400’, 2700’, and 3000’.

**5.6 DOCSIS Pre-equalization MIBs **

DOCSIS pre-equalization coefficients indicate different things depending
whether the CMTS or the CM is being queried. The information that is available
through MIBs relate to what the CMTS and CM keep track of at the time the
respective devices are being queried. Through the ranging interaction
discussed in Section 5.3.1, the CMTS MIB (docsIfCmtsCmStatusEqualizationData)
provides the adjustment necessary to update the CM coefficients and achieve
upstream path distortion compensation. The CM MIB
(docsIfCmStatusEqualizationData) indicates the current predistortion that is
applied to the upstream signals.

The MIB format is as follows:

![](PNMPFull.files/image026.png)

**5.6.1 DOCSIS 2.0 and 3.0 Pre-equalization MIBs **

Pre-equalization data is relevant in CM-CMTS channel combinations. In DOCSIS
2.0 the CM supports a single upstream channel, meaning the CM and CMTS reports
a single pre-equalization data value. In DOCSIS 3.0 the pre-equalization data
is measured for each of the upstream channels of the CM. To accommodate DOCSIS
3.0, the RFI management requirements were changed and DOCSIS 2.0 and 3.0 have
separate MIBs for pre-equalization measurements. An additional per channel
pre-equalization data measurement is also available and briefly discussed in
this section to avoid confusion on usage of the appropriate information.

**_5.6.1.1 Per CM Pre-equalization _**

Table 2 presents semantically identical management objects for CM and CMTS for
both DOCSIS 2.0 and 3.0.

![](PNMPFull.files/image028.png)

**_5.6.1.2 Per Interface Equalization _**

For the original RFI MIB requirements there is a per interface pre-
equalization data element that is common for DOCSIS 2.0 and 3.0, the
docsIfSigQEqualizationData from the docsIfSignalQualityTable.

For the CM, this data provides equalization information of the downstream
receiver at the CM. In the downstream direction, the CM does not rely on the
CMTS to generate equalization coefficients, but it is solely responsible for
this blind equalization process. Variability in downstream equalization
coefficients, over time, can be used to detect ingress and interference in the
downstream spectrum. The downstream equalization structure is not specified.
The implementer has the flexibility to differentiate in the type of equalizer
structure and design used. Traditional feed-forward structures or decision
feedback structures are implementation examples, although decision feedback
structures have likely been used. The current MIBs may not properly described
the state of the downstream equalizers implemented. A number of downstream
equalization MIB implementations are not reliable. In order to effectively
leverage information from the downstream equalizers, it is important to
introduce a specification update through the EC process.

For the CMTS this object was intended to report some type of aggregated
equalization value for the entire upstream channel. RFI MIB [RFC4546]
clarifies the CMTS does not need to report a value other than an empty string.

Note that this equalization data is not relevant to the scope of this
document.

**6 METHODOLOGY FOR PNM USING UPSTREAM EQUALIZATION **

**6.1 General Approach and Processes **

The proactive network maintenance methodology that is based on pre-
equalization coefficients can be described in terms of a few key general
components.

The first general component is the data collection process. It comprises
polling all CMs and CMTSs to obtain pre-equalization data from all configured
upstream channels. The gathered data is verified for format integrity and is
normalized to be useful for comparison. For scalability purposes, the data
collection process is conducted using a more frequent polling cycle for the
CMs that exhibited apparent distortion above a pre-determined level and a less
frequent cycle for all CMs.

The second general process incorporates the initial distortion assessment that
is conducted on all CMs that are monitored more frequently. This process uses
the non-main tap to total energy (NMTER) ratio to discriminate which CMs
should be examined in more detail and which should be left for evaluation in
the next coarse monitoring cycle.

The third component in this approach conducts the detail analysis that
includes the calibration process and the determination of the distortion
signatures from frequency domain and time domain analysis. These signatures
include group delay and micro-reflections. In case of multiple different
micro-reflections, the signatures are obtained after a discrimination process.

The fourth component takes the distortion signatures and evaluates whether
from a static perspective they should be classified as red which implies the
need for immediate action, or as yellow which indicates the CM should be
monitored more frequently and its distortion data be stored for observation
over time. The information describing which CMs have to be examined more
frequently is communicated to the data collection process. Green
classification indicates that no action is necessary.

The fifth process takes the CM signatures and identifies within a fiber node’s
service area which micro- reflections are common to several CMs. The next
process identifies by comparing historical data collected in the yellow
classified CMs whether intermittent issues or trending issues are of concern
and may require action.

The last process is the one that correlates the affected CM or CMs with the
outside plant topology and uses that information to determine fault location.
Figure 13 shows a diagram of the process just described.

![](PNMPFull.files/image030.png)

**6.2 Format Verification, Normalization and Guidelines **

The structure of the pre-equalization information has been described in
Section 5.6. How the values within this structure are interpreted depends on
implementation. The first four byte-long elements in the header are to be
interpreted in HEX mode. For example, the number of adaptive equalizer taps
value of 18 in HEX is 24 in decimal (Figure 14). The rest of the equalizer
structure defined in two byte increments containing the real and imaginary
coefficients should be interpreted according to 2’s complement over the entire
two bytes or 4 nibbles describing the real or the imaginary coefficients. For
example, the 2’s complement of a 2 byte such as the fourth real coefficient is
FFFC which in 2’s complement is -4 (red circle).

![](PNMPFull.files/image032.png)

The representation of coefficients often differs among CM vendors. There are
variations in maximum amplitude as well as variations in the way the
coefficients are interpreted. Table 3 highlights the different interpretations
that exist for the most popular CMs deployed.

![](PNMPFull.files/image034.png)

![](PNMPFull.files/image036.png)

The CM vendors had two interpretations of how to decode the coefficients. One
is the four nibble 2’s complement interpretation and the other is the three
nibble 2’s complement interpretation. The four nibble 2’s complement
interpretation is the one assumed by the spec but there is a significant
number of CMs deployed with the three nibble 2’s complement interpretation.
Regarding maximum amplitude, CMs have maximum amplitude equal to 2047, 1023 or
511. If the coefficients are normalized, the difference in CMs’ maximum
coefficient amplitude turns into a difference in granularity. The difference
then becomes one of decoding interpretation of coefficients.

**6.2.1 Four Nibble 2’s Complement Pre-equalization Coefficient Representation **

In this real or imaginary coefficient representation the entire four nibbles
(two bytes) are used. This means that if the first bit is 0 the rest of the
bits represent a positive integer binary number. If the first bit is 1, it is
a negative 2’s complement number. The actual value can be calculated by
inverting the bits and adding 1, resulting in the negative of the number. Both
positive and negative examples have been included below.

a) 000D = 0000 0000 0000 1101 = 13

b) FFFE = 1111 1111 1111 1110after inverting it and adding 1 → 0000 0000 0000
0001 + 1 = 0000 0000 0000 0010 = 2 → The number is - 2



**6.2.2 Three Nibble 2’s Complement Pre-equalization Coefficient Representation **

In this real or imaginary coefficient representation the last three nibbles
out of the two coefficient bytes are used for the calculation. In this
interpretation the first nibble is 0 which could erroneously led one to
believe that all coefficients are positive. Only after eliminating the first
nibble one can tell if a number is positive or negative. This means that if
the fifth bit is 0 the rest of the bits represent a positive integer binary
number. If the fifth bit is 1, it is a negative 2’s complement number. The
actual value can be calculated by inverting the bits of the three nibbles and
adding 1. This is the negative of the number in question. Both positive and
negative examples have been included below.

a) 000D = 0000 0000 0000 1101 → eliminate the first nibble → 0000 0000 1101 =
13

b) 0FFE = 0000 1111 1111 1110 → eliminate the first nibble → 1111 1111 1110
afterinvertingitandadding1→ 000000000001+1=000000000010 =2→Thenumberis-2

**6.2.3 Universal Decoding **

Since in current implementations the maximum value that a coefficient can take
is always less than or equal 2047, the first nibble is never used and can be
removed to generate a universal decoder. After removing the first nibble, the
decoding process would be identical to the third nibble process.

**6.3 Key Metrics **

The real and imaginary complex coefficients of a DOCSIS 2.0 upstream pre-
equalizer defined as: F1R, F1I, F2R, F2I, F3R, F3I, F4R, F4I,. . . F23R, F23I,
F24R, F24I, and will be used to define several key metrics that follow.

**6.3.1 Adaptive Equalizer Main Tap Energy **

The adaptive equalizer main tap in DOCSIS 2.0 is typically in tap position
eight although some CMTS implementations can have it in as low as the sixth
position. In DOCSIS 1.1 the main tap is in the fourth position. The equalizer
tap energy is given by the sum of the squares of the real and imaginary
components of the coefficient.

The main tap energy (MTE), assuming it in eighth position, is defined as:

![](PNMPFull.files/image038.png)

**6.3.2 Main Tap Nominal Energy and Main Tap Nominal Amplitude **

The DOCSIS pre-equalization taps exhibit different nominal or maximum
amplitudes depending on CM implementations. The maximum of amplitude
implementations from CMs are 2047, 1023 or 511. This parameter is defined here
as the main tap nominal amplitude (MTNA). The square of the nominal amplitude
yields the nominal tap energy.

The main tap nominal energy (MTNE), assuming main tap is in the eighth
position, is defined as:

![](PNMPFull.files/image040.png)

**6.3.3 Pre-Main Tap Energy**

The summation of the energy in all equalizer taps prior to the main tap
provides the pre-main tap energy

(PreMTE). The pre-main tap energy assuming a main tap in the eighth position
is defined as:

![](PNMPFull.files/image042.png)

**6.3.4 Post-Main Tap Energy **

The summation of the energy in all equalizer taps after the main tap provides
the post-main tap energy (PostMTE).

The post-main tap energy assuming a main tap in the eighth position is defined
as:

![](PNMPFull.files/image044.png)

**6.3.5 Total Tap Energy **

The summation of the energy in all equalizer taps provides the total tap
energy (TTE). The total tap energy is defined as:

![](PNMPFull.files/image046.png)

**6.3.6 Main Tap Compression **

Adaptive equalizer main tap compression (MTC) at the CM is a good indicator of
the available margin for the continued reliance on the equalization
compensation process. An MTC ratio greater than 2 dB may suggest that
equalization compensation can no longer be successfully achieved. This metric
is given by the ratio of the energy in all taps to the main tap energy.

The main tap compression expressed in dB is defined as:

![](PNMPFull.files/image048.png)

Main tap compression at the CM translates to a less RF power level delivered
to the CMTS. An MTC of 2 dB results in the CMTS receiving 2 dB less input
power.

Main tap compression at the CMTS is not expected under normal operating
conditions. Any level of main tap compression at the CMTS should raise an
alarm.

**6.3.7 Main Tap Ratio **

Adaptive equalizer main tap ratio (MTR), the ratio of energy in the main tap
to the energy in all other taps combined, is useful distortion metric to
determine the distortion level in the upstream path. MTR is approximately the
same as non-main tap to total energy ratio (NMTER, see Section 6.3.8), except
at extremely high distortion levels. In most cases MTR can be used instead of
NMTER.

![](PNMPFull.files/image050.png)

![](PNMPFull.files/image052.png)

**6.3.8 Non-Main Tap to Total Energy Ratio (Distortion Metric) **

The adaptive equalizer’s non-main tap to total energy ratio is another useful
“distortion metric” to determine the distortion level in the upstream path.
This parameter can be used as an initial assessment tool to determine which
CMs need to be examined further and more frequently. This distortion metric is
given as the ratio of the aggregate energy that exists in all but the main tap
to the energy in all of the adaptive equalizer’s taps.

The non-main tap to total energy ratio expressed in dB is defined as:

![](PNMPFull.files/image054.png)

Notice that the main tap energy in the numerator is missing. The non-main tap
energy ratio is also a good estimation of the MER assuming that the signal is
not impacted by impairments that are not considered linear distortions, such
as burst noise and nonlinear impairments.

Non-main tap to total energy ratio at the CMTS is a good indicator of the type
of upstream performance the CM signals have based on the amount of linear
distortion present. If a 27 dB CNR is assumed for negligible errors with a
64-QAM signal, a NMTER target value of -27 dB can be assumed for comparable
performance. If a 30 dB CNR is the threshold where correctable errors are
beginning to appear, that would also correspond to a threshold of -30 dB NMTER
when correctable errors begin to appear. This CNR to NMTER relationships are
useful in determining thresholds from the NMTER values. An operator could
assume an immediate action (red) NMTER threshold of -27 dB for 64-QAM
operation and a monitor more frequently (yellow) NMTER threshold of -30 dB.

**6.3.9 Pre-Main Tap to Total Energy Ratio **

The adaptive equalizer’s pre-main tap to total energy ratio (PreMTTER) is a
useful parameter, along with the adaptive equalizer’s pre-post tap symmetry,
to determine the group delay level in the upstream path. This distortion
metric is the ratio of the pre-main tap energy to the energy in all taps.

The pre-main tap to total energy ratio expressed in dB is defined as:

![](PNMPFull.files/image056.png)

**6.3.10 Post-Main Tap to Total Energy Ratio **

The adaptive equalizer’s post-main tap to total energy ratio (PostMTTER) is a
useful parameter to assess micro-reflection impairment contribution. This
distortion metric is the ratio of the post-main tap energy to the energy in
all taps.

The post-main tap to total energy ratio expressed in dB is defined as:

![](PNMPFull.files/image058.png)

**6.3.11 Pre-Post Energy Symmetry Ratio **

The pre-post energy symmetry ratio (PPESR), along with pre-main tap to total
energy ratio, is a useful parameter to indicate the presence of group delay in
the upstream path. This distortion metric is the ratio of the post to pre-main
tap energy ratios.

The pre-post energy symmetry ratio expressed in dB is defined as:

![](PNMPFull.files/image060.png)

For practical purposes, the pre-post energy symmetry may be approximated using
only the two taps adjacent to the main tap, giving the pre-post tap symmetry
ratio (PPTSR):

![](PNMPFull.files/image062.png)

**6.3.12 Group Delay Distortion **

Group delay distortion is a type of linear distortion that is also corrected
by the pre-equalization process. Figure 15 shows group delay increase with
frequency for increasing number of cascaded actives. This configuration does
not include the impact of chokes in the lower portion of the spectrum
(typically 5-10 MHz) and it does not assume additional in-line equalizers.

![](PNMPFull.files/image064.png)

As observed in Figure 15, there is a variation in group delay of up to 300 ns
in a channel that is located at the band-edge. The pre-tap equalization
coefficient energy increases in the presence of group delay distortion.
Additional group delay details are discussed in the tutorial section (Appendix
I).

**_6.3.12.1 Group Delay Distortion at Band-Edge with No Micro-reflection _**

Table 4, Figure 16, and Table 5 relate to the scenario where the DOCSIS
channel is at the band-edge and there is no micro-reflection present. Table 4
shows the impact of group delay distortion on tap energy when the upstream
channel is at the band-edge and no micro-reflection is present.

![](PNMPFull.files/image066.png)

Figure 16 shows how when operating at the band-edge, the pre-main tap energy
increases proportionally with increasing cascade depth. This is characteristic
of the group delay distortion impact on tap energy. The effect of group delay
distortion could be hidden just by looking at cascade depth in a plant
topology map. In-line equalizers which may not be obvious in a plant topology
diagram may contribute to distortion just as diplexers within amplifiers do.
In severe distortion cases, assessment of pre-main tap energy could be used to
determine whether certain CMs should be moved to lower distortion channels in
the middle of the upstream band.

![](PNMPFull.files/image068.png)

Key metrics worth highlighting in Table 5 are the PreMTTER that increases with
cascade depth while the PostMTTER shows low values as no micro-reflections are
present. The PPESR show high positive values since in this scenario the
dominant impairment is group delay distortion. The low values of MTC are
indicative that the pre-equalization compensation is effective.

![](PNMPFull.files/image070.png)

**_6.3.12.2 Group Delay Distortion at Band-Edge with 0.5 μs Micro-reflection _**

Table 6, Figure 17, and Table 7 relate to the scenario where the DOCSIS
channel is at the band-edge but there is also a 0.5 μs micro-reflection
present. Table 6 shows the impact of group delay distortion on tap energy.

![](PNMPFull.files/image072.png)

Figure 17 shows how when operating at the band-edge, the pre-main tap energy
increases with increasing cascade depth but not as noticeably as the scenario
without micro-reflections depicted in Figure 16. This is due to some pre-main
tap energy needed to compensate for the micro-reflection which adds to the
pre- main tap energy that is caused by group delay distortion. This leaking of
energy into the pre-main tap region is more prevalent with shorter micro-
reflections that use the taps closer to the main tap for compensation than the
longer micro-reflections that use the higher value taps.

![](PNMPFull.files/image074.png)Key metrics worth highlighting from Table 7
are the PreMTTER that increases with cascade depth. The PostMTTER shows a high
value indicative of the micro-reflection present. The PPESR show negative
values since in this scenario the dominant impairment is micro-reflection. The
combined group delay distortion and micro-reflection by themselves is properly
compensated through the pre-equalization process, although some increase in
MTC begins to show.

![](PNMPFull.files/image076.png)

**_6.3.12.3 Distortion in Middle of Upstream Band with Micro-reflection _**

Table 8, Figure 18, and Table 9 relate to the scenario where the DOCSIS
channel is operating in the middle of the upstream band with a 0.5 μs micro-
reflection present. Table 8 shows the impact of distortion on tap energy.

![](PNMPFull.files/image078.png)

Figure 18 shows how when operating in the middle of the band, there is no
increase in pre-main tap energy with increasing cascade depth as the group
delay is fairly flat. (See also Figure 15.) Figure 18 shows how post-main tap
energy is used in compensating for the micro-reflection. Figure 18 also
illustrates how a small amount of pre-main tap energy is used in compensating
for the fractional delay 0.5 μs micro- reflection. When the micro-reflection
delay doesn’t coincide with a tap delay, neighboring taps are used for
compensation. This explains why in Figure 17 the increase of pre-main tap
energy with increasing cascade depth is not as noticeable as in the “group
delay only” case depicted in Figure 16. The combined effect of group delay
distortion and a 0.5 μs micro-reflection of Figure 17 can be approximated to a
rough superposition of Figure 16 representing the “group delay only” case and
Figure 18 representing the “micro-reflection only” case.

![](PNMPFull.files/image080.png)

Some key metrics from Table 9 are worth highlighting. The low PreMTTER value
is indicative of negligible group delay distortion. The PostMTTER high value
is indicative of the strong micro-reflection present. The PPESR show negative
values since in this scenario the dominant impairment is the micro-reflection.
The MTC value is higher than the previous two scenarios which indicates that
the pre-equalizer may be beginning to lose its equalization compensation
effectiveness.

![](PNMPFull.files/image082.png)

**6.4 DOCSIS Pre-equalization Coefficient Data Collection **

DOCSIS pre-equalization coefficient information is obtained by using simple
network management protocol (SNMP). The SNMP management information base (MIB)
describes information which is available in a standard manner across all
implementations that comply with the DOCSIS MIB definitions.

At a minimum, there are three data elements required to complete the
mathematical transformations described in this document. The three values are
the DOCSIS equalization coefficients, upstream center channel frequency, and
the RF bandwidth of the channel. The three data points are obtained from the
cable modem and the CMTS. Having the cable modem coefficients provides a view
of the inverted channel

response prior to equalization. The CMTS offers a post-equalization view of
the inverted channel response as it is received from the cable modem. This can
be helpful when evaluating the performance of the modems’ upstream pre-
equalizers. It can also help identify issues where the impairment is changing
frequently.

In addition to the three required data elements, there are other metrics which
can be used to help identify and localize areas of impairment. These other
elements may already be available as a result of pre-existing monitoring
systems. One should extend or reuse existing data as opposed to over-polling
the modems or CMTS.

**6.4.1 SNMP Implementation and Performance Considerations **

Large SNMP implementations can represent unique challenges when scale is
considered. First, assuming DOCSIS 2.0 pre-equalization coefficients and their
storage as characters, the minimum over-the-wire network impact is 614 bytes
per modem/CMTS pair. This is calculated using the PDU sizes of the minimum
required data elements. In this case, both the modem and CMTS coefficients are
299 bytes while the frequency and RF bandwidth together are 16. Assuming
binary representation the storage requirements are 100 bytes each (4 bytes
header + 96 bytes real and imaginary coefficients data) for CMTS and CM and 4
bytes each for upstream frequency and channel width totaling a minimum of 208
bytes.

Example:

**docsIfCmStatusEqualizationData **(299 bytes character storage, 100 bytes binary storage) 

08 01 18 00 00 04 ff fd ff fb ff fa ff fd ff fd 00 07 00 04 ff f8 00 00 00 17
ff ff ff d6 ff e8 07 f7 ff f9 ff 8a ff 94 ff f7 00 28 00 11 ff ec ff f7 00 19
00 06 ff f5 ff fc ff ff 00 0d ff fb 00 01 00 01 00 04 00 04 ff f6 00 07 00 07
ff fb 00 00 00 08 ff ff ff fe 00 00 00 04 ff fc ff ff 00 08 00 00

**docsIfCmtsCmStatusEqualizationData **(299 bytes character storage, 100 bytes binary storage) 

08 01 18 00 FF C8 FF F0 FF F8 FF E8 FF C0 00 20 FF F8 00 38 FF C8 FF D8 00 18
00 18 00 38 FF F0 3F 20 00 00 00 08 00 40 FF D8 FF E8 00 38 FF D0 FF D8 FF B8
00 08 FF D8 00 40 00 40 FF E8 00 00 00 00 FF C0 00 48 00 20 00 20 00 58 00 10
FF F0 00 00 FF E8 FF F0 FF D8 00 50 00 00 FF D8 FF F0 00 18 FF E8

**UpstreamFrequency **(8 bytes character storage, 4 bytes binary storage) 29300000 **UpstreamWidth **(8 bytes character storage, 4 bytes binary storage) 6400000 

A payload of 614 bytes with a million devices translates to nearly 600
megabytes. At 5 million devices, a single poll represents almost 3 gigabytes.
This traffic would be distributed between both the CMTS and the cable modems.
Careful consideration should be made regarding the impact on routers,
firewalls, traffic monitors, the CMTS, and other network elements.

In large implementations, heavily threaded/distributed SNMP processing will be
required to accommodate the large number of requests. Assuming 250
milliseconds round trip query latency, 1 million devices would require 70
hours of CPU time if executed serially. Given that most of the CPU time is
spent in wait state, a horizontally scaled execution can be very effective.
Specifically, “horizontal scale” can be achieved by adding additional CPUs or
polling nodes. When this same load is distributed across 1000 threads of
process, that time is reduced to sub five minutes.

If the network topology is well known at the time of polling, a geographically
sensitive polling approach might be considered. Also, market specific
maintenance windows may be among the factors to consider in polling cycle
timing.

**6.4.2 Data Collection Strategy **

Initially, three polling rates are discussed to accommodate different levels
of analysis. First, a low-rate cycle should be used to acquire a daily
baseline of data used for coarse grained analysis. This coarse grained
analysis will provide several metrics calculated from the raw coefficient data
prior to Fourier transformation. Analysis of the coarse metric will narrow the
scope of devices which qualify for medium- rate polling. This secondary
polling cycle will be used to drive further equalization analysis which
includes a Fourier transformation to the frequency domain. The intent of the
medium-rate polling is to insulate the data processing layer from
unnecessarily processing modems that are currently operating within acceptable
thresholds. Finally, the high-rate poll cycle will be used to provide low
latency visibility to a small subset of devices. Given the expense associated
with polling, storage and analysis, this stage should be reserved for only the
most critical or otherwise material-interest devices.

**_6.4.2.1 Low Rate (once daily, rotating across eight-hour time-shifts, adjustable) _**

Modem based pre-equalization coefficient data should be collected once per
day. It’s possible that certain plant problems might be specific to the time
of day. These scenarios might include weather patterns, watering systems and
other time-based anomalies. Assuming an eight-hour window to complete polling
(including accommodation for maintenance), a three shift pattern should work
well. This could be achieved by a single daily poll with a time offset of 32
hours. Likewise, the modem population could be divided by three and the load
distributed throughout the day. In the latter approach, it would be important
to rotate the three modem populations to correctly achieve the desired result
(Table 10 and Table 11).

CMTS based equalization coefficient data should be collected as close in time
to the modems as possible. Understanding that the SNMP process for gathering
data from the CMTS will be decoupled from the modems is important. The most
efficient way to obtain this data from the CMTS would be a bulk walk (SNMP) of
the docsIfCmtsCmStatusEqualizationData table. This will return a large swath
of data, while the modem collection threads are completely independent and
non-synchronized with the CMTS process.

Using the main tap compression and non-main tap to total energy ratio formulas
(see Key Metrics, Section 6.3), modems of interest are identified and promoted
to the medium-rate polling cycle. These will remain under medium-rate scrutiny
until the correct threshold is met for some predetermined time. Initially, 48
hours is recommended.

![](PNMPFull.files/image084.png)

**_6.4.2.2 Medium - Rate (every four hours, adjustable) _**

The secondary level of analysis will require greater resources to gather,
store, and analyze, so sizing should be done based on preliminary results of
the initial low-rate poll. This poll will handle the subset devices of
interest. Devices may be promoted/demoted across low, medium and high rate
polling as described in the analysis section of this document. Table 12 and
Table 13 show medium rate polling examples.

![](PNMPFull.files/image086.png)

High - Rate (ten minute, adjustable)

Only devices of the highest interest will be candidates for high-rate polling.
This will most often be the result of manual intervention to facilitate real-
time troubleshooting or field analysis. In general, there will be limits
placed on high-rate entries which automatically expire in a designated period
of time

**6.5 Calibration Mechanisms ****6.5.1 CMTS-CM Short Reference Plant **

Improved accuracy may be achieved by subtracting the contributions of the CMTS
and cable modem(s) from the end-to-end channel response, leaving just the
channel response signature of the cable network. Determining the channel
response distortion contributions of these two components can be done using a
short reference plant-sometimes called a six foot plant-which isolates the
CMTS and cable modem(s) from the cable network. Adaptive pre-equalization
coefficients can then be used to characterize the response signature of the
combined devices, much the same as is done to characterize end-to-end pre-
equalization signatures in an operating cable network. Once the CMTS and modem
response signatures are known, they can be subtracted from operational field
measurement results. It is recommended that this characterization be performed
for each make/model CMTS and cable modem combination in use.

The short reference plant illustrated in Figure 19 has been measured with a
vector network analyzer, and verified to provide optimum performance using the
parts listed in Table 14. Choose a diplex filter that has a frequency split
well above the normal operating upper frequency limit of the return path. This
will reduce the group delay contribution of the diplex filter. For example, a
5-42 MHz DOCSIS return should use at least the 65/85 MHz split diplex filter
in the short reference plant.

Interconnecting cables should be as short as practicable, and where it is
possible to eliminate cables altogether, one should use appropriate male-male
or female-female F-type splices. In any case, avoid exceeding the maximum
cable lengths shown in Figure 19\.

![](PNMPFull.files/image088.png)

![](PNMPFull.files/image090.png)

**6.5.2 Pre-equalization Calibration Approach **

The pre-equalization process between CMTS and CM compensates not only for the
distortion that occurs in the plant, but also for any existing distortion that
exists in the upstream path following the transmit equalizer within the CM up
to the baseband receiver inside the CMTS. This includes filters, modulators,
and amplifiers in the CM, the home network, combining network at the hub or
headend as well as the front-end components in the CMTS (Figure 20).

![](PNMPFull.files/image092.png)

If there was a-priori knowledge of the distortion contributed by the CM and
CMTS, it could be calibrated out in order to have a more accurate
representation of the distortion in the field.

Generating a database with all the possible CM and CMTS model pairs is
feasible given that there are a limited number of CM and CMTS implementations.
A known short plant setup consisting of a CMTS-CM pair and a few fully
characterized components enables determining almost exclusively the
contribution of the CM and CMTS internal distortion. Section 6.5.1 describes
an example of a known short plant where the internal characteristics of the
CMTS and CM can be measured. The CMTS-CM internal distortion is obtained by
gathering the pre-equalization coefficients of the CM after allowing a few
maintenance intervals to elapse to achieve convergence of the coefficients.

Assuming that the real and imaginary values of the 24 CM pre-equalization
coefficients for a particular CMTS-CM model pair measured on a short
calibrated plant are given by:

![](PNMPFull.files/image094.png)

For every ith real and imaginary coefficient, the resulting complex number is
obtained,

![](PNMPFull.files/image096.png)

Resulting in the following complex coefficients

![](PNMPFull.files/image098.png)

Similarly, assuming that the real and imaginary values of the 24 CM pre-
equalization coefficients obtained in the field, matching the CMTS-CM model
pair being analyzed, are given by:

![](PNMPFull.files/image100.png)

The resulting complex coefficients are

![](PNMPFull.files/image102.png)

Given 24 complex coefficients and assuming that the equalizer’s main tap is
located at tap position number 8, a 32 element fast Fourier transform can be
used to translate from the time domain into the frequency domain. Tap 8 would
coincide with FFT input element 16 to preserve the relative position of the
response in frequency.

The mapping of coefficients to FFT input parameters follows:

![](PNMPFull.files/image104.png)

The mapping for the coefficients obtained using the short plant measurement
results in the following:

![](PNMPFull.files/image106.png)

After calculating the 32 point FFT the following frequency response values are
obtained:

![](PNMPFull.files/image108.png)

For calibration, the magnitude of the field coefficients are divided by the
magnitude of the short plant coefficients and the phase of the short plant
coefficients are subtracted from the phase of the field coefficients.

![](PNMPFull.files/image110.png)

From the calculated magnitude and phase values, the corrected F’out frequency
response values are obtained

![](PNMPFull.files/image112.png)

Additional granularity in the frequency response representation can be
obtained by inserting zeroes to a larger size FFT such as a 64, 128 or 256
FFT.

An example of the calibration process is illustrated next.

Figure 21 shows the distortion of a CMTS/CM pair in a short calibrated plant
versus the same CMTS/CM pair measured in the field. The pre-equalization
coefficients obtained from the CM MIBs are shown in Table 15.

![](PNMPFull.files/image114.png)

The first four bytes 08 01 18 00 provide the main tap position “08”, the
number of taps per symbol “01”, the number of taps “18” (hex number for 24)
and a reserved byte. The rest of the information are the real and imaginary
coefficient data (2 bytes each) for the 24 taps.

![](PNMPFull.files/image116.png)

The distortion in the short plant scenario is predominantly impacted by the
CMTS receiver and CM transmitter. Therefore, to calibrate out the impact of
the CMTS and CM, the frequency response of the short plant (micro-reflection
off) is subtracted from the frequency response of the micro-reflection on
scenario. This calibrated response is shown in blue in Figure 22.

![](PNMPFull.files/image118.png)

Averaging ΔF and ΔA values is no longer necessary since the calibrated
response is fairly even across the frequency range under observation.

**6.6 Fault Localization **

The process of fault detection and localization relies on monitoring the
network for general plant-wide or neighborhood-localized problems as well as
for specific end devices. In this process it is assumed that there is detailed
knowledge of the node service area’s topology. It is also assumed that
distortion data (pre-equalizer coefficients and other applicable information)
has been collected from the CMs and analyzed to determine the distortion
signatures of the affected CM(s). Next, a process is described by which,
through correlation of topology with distortion signatures, the location of
faults can be determined.

In the example highlighted in Figure 23 is a group of CMs, identified in red,
that exhibit the same unique distortion. The CMs in green are CMs that don’t
share that specific distortion.

It is assumed that to obtain the distortion signatures, an analysis and
classification process of the impairments has already taken place.

If only information from one CM were available, the problem area could only be
isolated to somewhere along the path between the CM and the fiber node (dashed
line). The more interesting process is when the relationships of CMs that
share specific impairments (as well as those that do not) to upstream paths
are examined.

In order to estimate the impairment location, the common path shared by the
end devices showing the specific impairment is found. This path containing the
impairment is further constrained by excluding the path that is shared with
the end devices that operate properly.

Knowledge of the micro-reflection signature also helps localize the problem.
For example, in Figure 23 a triple transit reflection signature with delay
matching the distance between known devices on the plant, such as distance
between taps, length of drops, or distance between amplifiers, can point to
the likely cause or narrow down the possible set of causes of the problem.

After analysis and path manipulation of the end devices showing impairments
such as micro-reflections, a potential location of the problem is determined.
These areas are shown in purple on Figure 23. This mechanism maps the devices
that have the same unique micro-reflection attribute and pinpoints the portion
of the network that exhibits the impairment.

![](PNMPFull.files/image120.png)

**6.6.1 Fault Localization Examples **

This section details basic examples of fault location based on micro-
reflection signatures. Data from a 6.4 MHz DOCSIS channel on a single fiber
node was used. A few limitations of the data set are worth noting. First, the
node was selected not for the diversity of problem scenarios but for the
availability of the digital maps. Therefore, the micro-reflections found were
not significant, and in most cases the scenarios detected corresponded issues
either near a line termination or impedance mismatches inside or near-the
home. Second, there was a relative low number of CMs in the 6.4 MHz channel in
this node which lead to few scenarios for evaluations as well as few
“monitoring probes/CMs” for accurate determination of the impairment location.
High penetration of CMs narrows the potential problem area where the leading
edge of the micro-reflection can be located.

**6.6.2 Determining Micro-reflection Signatures **

A micro-reflection signature consists of a pair of characterizing elements,
the relative level of the reflected signal compared to the main signal and its
delay. The level provides an indication of the severity of the micro-
reflection (see Section 6.7.4 for Severity Analysis Strategy for Intermittent
Issues considerations). The delay represents the extra distance traversed by
the reflected signal or echo and is represented in microseconds (see Section
5.2.1 for definitions of micro-reflections types).

Figure 24 shows the frequency response of several CMs sampled from a fiber
node. For clarity, only a few CMs are included in the figure. However, in the
field, if encompassing an entire fiber node, the technician will have to pay
close attention to the chart to distinguish and extract the common micro-
reflections (labeled as A and B in Figure 24 and Figure 25) from all the
micro-reflections present. Nonetheless, the intention of this section is to
explore systematic mechanisms where human intervention can be minimized as a
first pass at extracting the most relevant cases for analysis and
troubleshooting. In summary, the micro-reflection signature which provides a
two-dimensional characterization from which the selection of common frequency
responses as noted in Figure 25 is feasible.

![](PNMPFull.files/image122.png)

![](PNMPFull.files/image124.png)

![](PNMPFull.files/image126.png)

As seen in Figure 25, the amplitude ripple of the frequency response is
sufficient to determine group the CMs with same micro-reflection. Some
amplitude variability margin must be allowed. Note that in a few cases, the
same ripple magnitude range could correspond to different micro-reflections.
In such cases the estimation of echo delay can provide an unambiguous answer.
For typical fiber node sizes the probability of uniqueness of a micro-
reflection is very high. In rare exceptions, the micro-reflection signature
pair will not be sufficient to determine the CM clusters (e.g., a sub-T echo
delay). In such cases, only the topology resolution will provide final
resolution of such conditions. Figure 26 shows the way that common signatures
of CMs are correlated. The delay is an approximation of the estimated maximum
delay and it is expressed as 2T where T is the inverse of the symbol period.
That means the distance between the two reflectors is calculated based on half
the delay. Delay below the "no action required" threshold is not relevant.

**6.6.3 Determining Micro-reflection Boundaries Edges **

For the relevant micro-reflections cases A and B, the next steps consist of
performing the localization within the HFC plant topology.

By considering the upstream direction and other CMs in the path that do not
present the same signature, the trailing edges of the micro-reflection is
determined as discussed at the beginning of this section.

Figure 27shows micro-reflection case A. This micro-reflection can be
considered as a composite of type 1 and 2. CM1 and CM2 are close to the Tap
reflecting the signal and CM 3 has an additional transit for the echo relative
to the distance to the reflecting tap. Hence the echo from CM3 (2.8T) is
longer than CM1 and CM2.

![](PNMPFull.files/image128.png)

Figure 28 shows the case of a single sub-T echo. The two signatures come from
the same household, H1, and note the neighbor CMs: CM4, 5, 6, and 7 do not
register the same micro-reflection signature as the CMs in observation.

![](PNMPFull.files/image130.png)

Note that limited data could lead to non-optimal location of the micro-
reflection. For example, fewer CMs reporting pre-equalization data or few
customers in the fiber node branch will reduce the possibility to accurately
estimating the location of the micro-reflection.

**6.6.4 Parabolic Interpolation **

In most cases the actual time delay of an echo does not land directly on the
delay of a tap in the pre- equalizer. Rather, the echo may occur at a delay
that lies somewhere between two taps. The purpose of the parabolic
interpolation algorithm is to improve the resolution of time delay estimation
to a fraction of a pre-equalizer tap.

Figure 29 below shows an example test case. Pre-equalizer taps 9, 10, and 11
have magnitudes 35 dB, 40 dB and 29 dB, respectively. We are not concerned
about other taps since the algorithm uses only a 3-point interpolator, so the
surrounding taps are plotted as zeros.



![](PNMPFull.files/image132.png)

The algorithm inputs are the 3 taps around the (local) peak: (x0,y0), (x1,y1),
(x2,y2), where the middle sample (x1,y1) is the local peak of interest. The x
value is the pre-equalizer tap number (typically in the range from 1-24) and
the y value is the tap magnitude in dB. It has been found empirically that
using the dB values gives good results; it is not necessary to convert from dB
values to power ratios. Hence for our example we have the following inputs to
the algorithm:

x0 = 9

y0 = 35

x1 = 10

y1 = 40

x2 = 11

y2 = 29

The algorithm fits a parabola, shown in the figure as a dotted blue line, to
the 3 taps. We assume the equation for the parabola is y = a*x^2 + b*x + c.

The following code solves for the location of the peak of this parabola:

![](PNMPFull.files/image134.png)

![](PNMPFull.files/image136.png)

The output is (x_out,y_out). The x_out value generally lies between integer
tap numbers, giving fine time location information. The y_out value may also
be used if fine magnitude accuracy is desired. In our example we have the
following outputs:

![](PNMPFull.files/image138.png)

**6.7 Severity Assessment **

The goal of any operator’s service department is to be invisible to its
customers’ experience. Too often leaders have reviewed post mortem reports
only to discover the failure was a slow degradation caused by water migration
and corrosion. In other words, there was an opportunity to resolve the
impairment before the customer had to alert the cable company to the failure
with a trouble call. This issue points squarely at the operator’s preventive
maintenance program or lack thereof. A plant inspection program such as system
sweep is a great idea but operators rarely have enough resources available to
inspect, locate and make repairs before a customer notices the failure.
Tracking the length of time it has been since an area has been inspected is
fine but it doesn’t solve the resource problem. Operators are left with
sweeping areas/nodes that are showing an increase in the number of trouble
calls or outages. This method is reactive, not proactive.

Planning an effective preventive maintenance program is based on historical
practices. When an operator uses statistics such as MER (SNR), FEC, T1-T4
timeouts, receive level and transmit power, which are all important variables
to track over time, data is being used that would be better served in an
active maintenance program. That being said, if the _MER _and _FEC _are bad
then the customer has already been influenced in a negative way. If the modem
is timing out on a range request or response, then the customer is being
affected. If the levels are fluctuating outside the expected range of the
design, then customers usually feel the pain. It turns out that adaptive pre-
equalization resolves a lot of plant impairments. Of course, there is a limit
to what can be compensated for using adaptive equalizers and for how long.
This is especially true when consideration is given to the fact that whatever
is already broken will continue to derade. The power of PNM lies in the
ability to be alerted to failure before MER and FEC and other statistics begin
to ring the alarm bells. If an operator is able to solve the problem within
the window that pre-equalization is saving the day, then trouble calls and
outages are being prevented and the customer’s experience is being preserved.

One of the first things an operator will need to determine is the MTR
threshold for what is good and bad. A good starting point would be to review
the original recommendations from CableLabs’ first document on PNM. The
following recommendations were included in that document: Thresholds will
determine which modems are green (no action required), yellow (high monitoring
frequency) and red (immediate action required). That information can then be
used for CMTS health. If the thresholds show most of the modems in red, then
that means that everything must be inspected. On the other hand, if the
thresholds are not reviewed regularly and updated, the operator could be
missing opportunities to improve. A few of the variables which the operator
should consider when selecting threshold include amplifier cascade, node size
and bandwidth utilization.

MTR severity should still be graded into three categories: immediate action
required (Red), high monitoring frequency (Yellow), and no action required
(Green).

From the original PNM document, the three severity assessment metrics that are
used for a single CM are defined as follows:

The first severity metric is a static classification conducted solely based on
the relative level of the MTR.

A second severity metric results from a trending analysis that is conducted so
that a network operator can identify an impairment degrading at a rate that
will result in immediate action in the near future (e.g., one week). This
method requires time stamping of the measurements gathered so that a history
of the impairment is obtained. Typically 3 dB of level change is worth
attention.

A third severity metric is generated from a historical comparison of the MTR
levels of the high frequency monitored CMs. This third metric measures
intermittent fluctuations that would be considered significant, but which did
not rise to the immediate action level. The measurements should be conducted
over multiple days. The comparison of the measurements is done at the same
time of the day. Again, 3 dB of level change should ring alarm bells.

![](PNMPFull.files/image140.png)

It is noteworthy to point out that this same approach can be applied to other
levels like _micro-reflection _or _group delay_. _Micro-reflection _levels can
be calculated by using the same formula for MTR while utilizing the equalizer
tap values that compensate for micro-reflections _Post-MTR _(usually taps 9
through 24). _Group delay _level is typically calculated using taps 1 through
7.

Operators that are new to the PNM process may want to use the following
metrics as a starting point for the first year or two. Explaining to a team of
technicians that 50% or better of their network is suddenly bad will not
inspire them to fully grasp a new idea. The metric in Table 16 will also
ensure that the most vulnerable parts of the network will receive attention
first.

![](PNMPFull.files/image142.png)

Systems that have short amplifier cascades may want to stick with the original
recommendation from CableLabs which is represented in Table 17. Amplifier
cascades that are fewer than four and have a well- established PNM team for
support would fall into this category. Plant Health index, which will be
explained later, that falls in the neighborhood of five would be well served
by this metric because there is room to improve.

![](PNMPFull.files/image144.png)

Another point that operators should consider is when a modem starts using a
more robust modulation type such as _16-QAM _because of high noise, it is a
clear sign that something is broken and needs attention. However, if the
metric doesn’t change in pace with the less demanding modulation type, a
problem could be concealed.

![](PNMPFull.files/image146.png)

It is valuable to know that a modem is compensating for impairments, but if
that was the limit of what could be ascertained, then it is unlikely PNM would
be a successful tool. The power of PNM is the comparison to and correlation
with other modems to identify clusters or groups that may be affected by the
same impairment. It is like turning all of the modems into mini-sweep meters
then comparing the response of those meters to identify problems. An operator
should keep track of the total number of groups and focus on reducing the
number over time.

CMTS or Plant Health is calculated by using the formulas on the next page.
This is an excellent way to take large numbers of modems’ MTR values and place
them on a scale from 1 to 10, with 10 being perfect. Since the desire is to
identify which node or upstream interface needs attention, a _Health Index _by
node doesn’t work well because it lacks clarity with so few modems. It is
better to flush out upstreams using an average level of MTR, micro-reflection
or group delay. The formulas are fairly simple in that they compare the number
of troubled modems or the total number of registered modems on the CMTS. Only
50% of the marginal/yellow modems are used in the formula since they are not
as damning as the critical/red modems. There are two basic spins on the
_Health Formula _which varies by the denominator. If a modem is unable to
produce an accurate MTR value, such as a legacy modem that doesn’t utilize
pre-equalization, then that modem should be excluded as shown in Formula 1. On
the other hand, if a significant number of green modems stop communicating
because of something outside the control of the operator, like commercial
power, than an operator could use Formula 2. Keep in mind the larger the total
number of modems that are being used in the formula, the better the index will
be. A well-operating system typically lives around the index of 7, but what is
more important is for an operator to have room to improve.

Customers care little about a cable operator’s measuring tools when it comes
to their ability to enjoy the service being provided.

CMTS/Plant Health Formula 1:

![](PNMPFull.files/image148.png)

CMTS/Plant Health Formula 2:

![](PNMPFull.files/image150.png)

The use of the trending or intermittent approach could be difficult since it
requires time stamping pre- equalization records and deploys an effective
filtering process that produces usable data without getting drowned by
information over- load. A good example would be the CableLabs-authored
SCTE/ISBE Cable- Tec Expo 2015 operational practice2. The authors were able to
show the ability to flush out noisy drops, which is traditionally a
painstaking activity, through the use of monitoring intermittent MTR activity.
Considering intermittent activity could be a tough sell if the plate is
already more than full with just trying to diminish the static opportunities.
However, every operator would benefit by building, early in their PNM tool
development, a methodology to time stamp and store data points. That data
would provide huge dividends as the outside plant performance improves. It is
also worth pointing out that tracking other metrics, which are easily recorded
and available, such as modems transmit or received power, could aid in the
initial identification of trouble-prone areas which could benefit from some
PNM support.

Using the pre-equalization mechanism defined in DOCSIS is efficient, resulting
in no performance degradation even in the presence of strong micro-
reflections. Pre-equalization may help decrease the urgency for plant repair,
but it should not be used to circumvent required plant maintenance. The
purpose of proactive network maintenance is to listen to important network
health metrics and take action before service is impacted.

Micro-reflection severity can be graded into three categories: immediate
action required (Red), high monitoring frequency (Yellow), and no action
required (Green).

The three severity assessment metrics that are considered for a single CM are
defined as follows:

The first severity metric is a static classification conducted solely based on
the relative level of the micro- reflection amplitude.

A second severity metric results from a trending analysis that is conducted so
that network operators can identify an impairment degrading at a rate that
will result in immediate action in the near future (e.g., one week). This
method requires time stamping of the measurements gathered so that a history
of the impairment is obtained.

A third severity metric is generated from historical comparison of the micro-
reflection levels of the high- frequency monitored CMs. This third metric
measures intermittent fluctuations that would be considered significant, but
which did not rise to the immediate action level. The measurements should be
conducted over multiple days. The comparison of the measurements is done at
the same time of the day.

Refer back to Figure 29 for an illustration of the severity assessment
metrics.

As seen from Figure 29, a single micro-reflection level of -18 dBc results in
an amplitude ripple of 2.2 dB and a -25 dBc micro-reflection results in an
amplitude ripple of 1 dB. See Micro-reflection Calculator in Appendix IV for
more information on converting ripple to relative micro-reflection levels.

**6.7.1 Initial CM Selection for Analysis **

It is assumed that the monitoring strategy combines a standard measurement
interval (MIntSTD) to monitor all CMs in the network with a frequent
measurement interval (MIntFREQ) for CMs that are deemed of interest for
further analysis. This initial assessment of which CMs need to be examined
further and more frequently can be done using the distortion metric MTR.

This distortion metric, expressed in dB, can quickly indicate which CMs have
to go through detailed signature analysis. These CMs of interest will also be
placed in the “monitor more frequently pool” to gather performance history and
detect signature trending and intermittent behavior.

Consider a scenario in which the threshold value of the distortion metric is
-25 dBc, as shown in 6.3. This means that any CM that exhibits a MTR > -25 dB
will undergo detailed coefficient analysis through which one or more micro-
reflection signatures will be determined. It is assumed for the analysis that
follows that the CM pre-equalization coefficients have already been analyzed
and manipulated, and distinct micro- reflection amplitude and delay signatures
have been obtained.

**6.7.2 Severity Analysis Strategy for Static or Single Data Point Scenario **

In a static environment where no change of pre-equalization data is assumed,
or when there is only one data point and not able to determine change, a
simple set of fixed thresholds can be used to determine severity categories.

For example, a total distortion energy amplitude of -25 dBc or lower may fall
into the category of “No Action Required,” while -18 dBc or greater may be
considered in the category of “Immediate Action Required.” Two thresholds
determine the three categories. In Figure 29, the values below -25 dBc belong
to the “No Action Required” category or green severity. The values above -18
dBc belong to “Immediate Action Required” category or red severity. The values
between -18 dBc and -25 dBc belong to the category “High Monitoring Frequency”
Category or yellow severity.

As additional data points are collected, time dependent analysis can be
conducted which is described in the next section. Since time dependent
analysis is conducted for CMs that are already in the yellow category from a
static perspective, the time dependent severity classifications only have to
define a red classification criteria.

**6.7.3 Severity Analysis Strategy for Trending **

If, for example, an analysis resulted in a single micro-reflection with a
signature of -22.2 dBc in amplitude and 0.5 μs delay, it would fall into the
yellow severity or “monitor more frequently” category. At the same time, a
second CM showing an initial signature of -19.2 dBc in amplitude and 1 μs
delay also falls into the yellow severity or “monitor more frequently”
category.

Assuming that the standard measurement interval (MIntSTD) is once a day and
the frequent measurement interval (MIntFREQ) is every four hours, the data
from these two CMs’ micro-reflection amplitudes tracked in time is detailed in
Table 19. The micro-reflection time delay is not used for comparison here and
is not shown. It is expected though that the changes in delay will be
negligible.

![](PNMPFull.files/image152.png)

The time measurement reference parameter Tn_m is coded as follows; the first
number (n) indicates the number of days after the initial measurement date,
while the second number (m) corresponds to the approximate time of day when
measurement was taken. This means that measurement T0_16 was taken at 4:00
p.m. on the same day as the initial stored measurement, and measurement T2_12
was taken two days after the first measurement and at 12:00 p.m.

Figure 31 plots Table 19’s micro-reflection amplitude versus time, indicating
that in less than three days, CM#1 will be going from yellow to red according
to the static criteria while CM#2 stays in the yellow region. These trends
should be conducted using data points measured at the same time of the day so
that approximately equal temperature data points are obtained.

![](PNMPFull.files/image154.png)

If CM#1 shows a delta of 1.8 dB between T0_0 (-22.2 dBc) and T1_0 (-20.4 dBc),
at that rate of change it will reach -18 dBc in less than three days with
respect to T1_0. The estimated level at T2_0 is -18.6 dBc and T3_0 would be
-16.8 dBc, crossing into the red region.

If delta amplitude per day is D, the last amplitude measured was MRLast and if
MRLast + 3 * D > Trending Red Threshold then it is classified as red for the
trending criteria.

3D is a variable subject to operator adjustment and is intended as a
recommendation.

In addition, another indicator of urgency is determined by the number of days
that the operator has until the micro-reflection amplitude reaches the red
region.

![](PNMPFull.files/image156.png)

**6.7.4 Severity Analysis Strategy for Intermittent Issues **

Another time-related behavior of adaptive equalizer coefficients operators may
observe is the rapid change of micro-reflection amplitude. This intermittent
behavior may be hiding a problem that is on the verge of causing service
interruption and should be addressed promptly.

Table 20 shows two CMs that are monitored more frequently as they initially
were categorized in the yellow category but one of the CMs shows a behavior
that cannot be explained with daily temperature variations.

![](PNMPFull.files/image158.png)

Figure 32 plots Table 20’s micro-reflection amplitude versus time showing CM#1
with significant micro- reflection amplitude swings. Both CMs remained in the
yellow region under the static severity criteria but CM#1 shows drastic
changes in micro-reflection amplitude which could be a loose connector or
something likely to break in the very near future.

![](PNMPFull.files/image160.png)

CM#2 shows gradual amplitude swings that could be attributed to daily
temperature variations. CM#1 shows significant variations in micro-reflection
amplitudes. A metric that could define the red classification criteria for
intermittent behavior is proposed as follows.

Intermittent Red Threshold = Avg 4 hour ∆ Ref. Amp / (Static Red Threshold -
Avg. Refl. Amp.) > 0.25 where the average four hour delta of the reflection
amplitude represents the average swing in dB over the four hour interval which
corresponds the monitoring granularity in time of the devices that were deemed
to need high-frequency monitoring and historical data tracking. The average
reflection amplitude is measured up to a fixed number of days (for instance,
four days). If this metric approaches 1 it indicates that the reflection
amplitude is varying with swings that approach the static threshold level. If
this metric is smaller than 0.1, for example, one can say that the reflection
amplitude swings occur at a safe margin below the static threshold.

The scenarios just discussed dealt with the quantification of the degree of
impairment of a single CM. It is assumed that a cable operator may add
weighting factors to indicate urgency in addressing these issues after the
previous information is correlated with the number of CMs affected by a
particular impairment. The analysis used to determine fault location can also
be used to determine how many users will be impacted.

**6.7.5 Grouping Similar Responses (Signature Matching) **

In many instances a single plant impairment will simultaneously affect
multiple cable modems. The affected modems will exhibit the same or similar
frequency response signatures. The following section describes how to identify
and group those responses, a process called signature matching. This technique
facilitates easier troubleshooting and repair of the problem. When locations
of modems affected by a common problem are overlaid on an outside plant map,
identification of where the common problem exists is simplified. Figure 33
shows an example of five groups of modems affected by five different plant
problems. The colored location markers on the left represent individual cable
modems, with each color corresponding to a group of modems affected by a
common plant impairment. The frequency response signatures on the right in the
figure are color-matched to their corresponding groups of modems. In other
words, the red modems are all affected by one particular plant problem common
to those modems; the purple modems are affected by a different plant problem,
and so forth.

![](PNMPFull.files/image162.png)

**6.7.6 Upstream Equalizer Response Matching Procedure **

It is important to determine a number of cable modems in a node that are using
a same common echo solution to discover a location of a plant impairment that
caused a common solution. If an echo is created in hardline plant, it will
likely affect more than one home. If an echo is created inside a home or on a
home’s drop, it will probably affect just the one home.

However it is possible for two modems both to share a common impairment, but
one or the other can also have unique impairments. For example, an impedance
mismatch inside a home could create a non-shared impairment. Fortunately, most
unique echo tunnels are less than 50 meters, which affect only taps 9 and 10.

When working on a trouble call, a technician wants to know if an upstream
linear distortion impairment problem one customer is experiencing is shared by
multiple subscribers. Localizing the impairment will determine where the
repair truck should go and whether an installer or line technician is required
to fix the plant fault.

The equalization coefficient data may be extracted from a database, or
alternatively the data may be obtained real-time by polling.

Digital signal processing is performed by processing one CM’s equalizer data
with another CM’s equalizer data. Two methods are discussed. A first method
uses complex frequency domain division of coefficients, where a resulting flat
frequency response means a perfect match. A second method is simpler complex
time-domain coefficient subtraction, followed by a restoration of the main
tap.

**_6.7.6.1 Process: _**

Determine all the MAC addresses connected to a node. This can be done by
connectivity records, or by examining the MAC addresses that are connected to
an upstream interface.

For each MAC address, obtain CM coefficient data and eliminate invalid
responses. This results in a reduced node list, with all CMs having valid
coefficient data. It is now desirable to reduce the number of match
computations, because the number of match computations is proportional to the
number of CMs squared. (The number match calculation for a typical node’s
population, while not negligible, can be done in several seconds with modern
computers.)

CMs must also belong to the same logical channel, including the same center
frequency and same bandwidth. Optionally, eliminate CMs that have unimpaired
responses. That is, if the main tap to all other tap energy (MTR) is below
some threshold, such as 25dB, there is no serious echo. This results in a node
list with all CMs having echoes needing to be matched, if possible. (Note that
if a very low match threshold is used, CMs coming out of the same factory or
of the same design will match.)

Going round-robin fashion, process each CM’s coefficients with each of the
other CMs’ coefficients and compute a single match value for each match pair.
If a match value is above some threshold (such as 18dB), indicating the two
unit match, a match result of 1 is set. Otherwise a match result of 0 is set.
Match results may be stored in a square matrix. If a node’s list of CMs
needing to be processed is 100 CMs, 10,000 comparisons will need to be
computed, resulting in 10,000 match values. See Table 21 for an example 20 x
20 matrix created with a match threshold of 18 dB. Because every unit matches
perfectly with itself, a diagonal line of 1s is obtained. Note in Table 21 for
an example 20 x 20 matrix created with a match threshold of 18 dB. Because
every unit that units 0 and 1 match, units 3 and 9 match, and units 11 and 17
match. More on matching processes later.

Convert the matrix into a symmetrical triangular matrix by forcing all
matching pairs to agree. For example, if unit 11 matches with unit 17, unit 17
is forced to match with unit 11.

From the matrix form groups of CMs with matching coefficients, and plot them
on a GIS map. One group-forming strategy is to remove CMs from the pool once
they are in a group. Another strategy is to incorporate GIS data to prevent a
mismatch. That is, a distant CM probably found its way into a group
accidentally.

Create work tickets for line technicians for each matching group.

Create work tickets for service technicians (or installers) with single homes
having unmatched bad responses.

**_6.7.6.2 Frequency Domain Division Method to Determine If Two CMs’ Responses Match _**

One method that can be employed to see if two units have matching responses is
to just “look at” or “eyeball” a plot of the complex coefficients in either in
the time domain or in the frequency domain. This is complicated by the
coefficients being complex with both real and imaginary components, so a two-
dimensional plot can be hard to interpret. So despite the human eye being a
versatile instrument, it is difficult for the human eye to establish a single
number that quantifies a difference between two similar- looking responses.
Other less-effective methods that could be used are to numerically measure the
ripple of the responses, or use the frequencies of peaks and troughs in the
responses.

A simpler method is to perform a de-convolution with a frequency domain (FD)
division of one unit’s FD coefficients with the other unit’s FD coefficients.
If two responses are exactly the same, a resulting quotient frequency response
will be unity at all frequencies, with a flat phase response at zero degrees.
This method is essentially a calibration process, with the denominator unit
being used as a reference value. De-convolution is a standard Matlab function,
and is most efficiently performed in the FD.

**Example: **

Assume the 24 coefficients from the MIB (time values) are zero-padded out to
32 and converted with a FFT, giving 32 frequency domain points.

Figure 34 is a plot of a set of coefficients for cable modem A with about a 14
dB T-spaced echo. The main tap on the plot has been barrel-rotated (circular)
from index 8 to 0. The main tap has a value of approximately 1.0, but the
vertical scale has been compressed to 0.2 to enhance the values of the taps on
a linear scale. The ratio of the energy in the main tap to all other taps
combined is 14.09 dB for modem A.

The corresponding “correction” frequency response is shown is Figure 35. Note
that the frequency response of the physical channel will be approximately a
frequency domain inverse of the response shown in Figure 35.

Figure 36 and Figure 37 are the corresponding frequency responses of Figure 34
and Figure 36 look alike in the time domain, and responses of Figure 35 and
Figure 37 look alike in the frequency domain. The ratio of the energy in the
main tap to all other taps combined is 15.3 dB for modem B.

Figure 38 is a quotient frequency set obtained by dividing each coefficient in
Figure 35 by a same- frequency coefficient in Figure 37. Thus, if a frequency
domain coefficient in Figure 35 is .55 at an angle of 130 degrees, and the
corresponding same-frequency coefficient in Figure 37 is 0.57 at 120 degrees,
a resulting coefficient in Figure 38 is 0.9065 (.55/.57) at an angle of 10
(130-120) degrees. If the coefficients in CM A and CM B were identical, Figure
38 would have a response of 1.0 at zero degrees at all frequencies.

At this point, a 32-point IFFT is employed to find an impulse response (time
domain) associated with the frequency-domain quotient response associated with
Figure 38, and a resulting time plot is shown in Figure 39 If the two
responses are absolutely identical, the impulse response would be 1.0 real and
0.0 imag at index 0 and 0.0 real and 0.0 imag (MTR) at every other time index.
The units are matched if the ratio of energy in the main tap to the energy in
all other taps is below some threshold, such as 25 dB. (In general, it is good
to make the threshold level adjustable.)

Experience has shown that some CMs that are experiencing a common hard-line
echo may also be experiencing a unique in-home echo. The presence of an in-
home echo may cause the matching process to fail for this house. This problem
can be mathematically remedied by zeroing-out the “close-in” taps on either
side of the main tap, thereby eliminating the energy of the house echo. This
method only works well when the hard-line echo is of a relatively long
duration.

In digital signal processing, equivalent processing can be done in either the
time domain or frequency domain. Time domain convolution is functionally
equivalent to frequency domain multiplication.

Matching code is available in the CableLabs’ member-accessible code
repository.

![](PNMPFull.files/image164.png)

![](PNMPFull.files/image166.png)

Main tap is 1.0, but vertical axis is clipped at 0.2 to enhance other taps on
linear vertical scale. MTR = 15.3 dB

![](PNMPFull.files/image168.png)

![](PNMPFull.files/image170.png)

Main tap is 1.0, but vertical axis is clipped at 0.2 to enhance other taps on
linear vertical scale. MTR = 14.09 dB

![](PNMPFull.files/image172.png)

![](PNMPFull.files/image174.png)

**NOTE: **Because CM A and CM B are experiencing the same echo, the quotient set is relatively flat. 

![](PNMPFull.files/image176.png)

Main tap is 1.0, but vertical axis is clipped at 0.2 to enhance other taps on
linear vertical scale. MTR = 27.3 dB, so the match is excellent and both
modems are seeing the same echo.

**_6.7.6.3 Method 2: Time Domain Subtraction Method to Determine If Two CMs’ Responses Match _**

This method is conceptually simpler than the frequency domain division method,
but produces similar results.

Take the 24 time domain coefficients from two CMs and normalizing the
responses by scaling. For example, if the main tap target is 2048, divide all
complex coefficients by 2048 to make a unity (approximately) main tap.

Then perform a complex subtraction of each time domain coefficient. Make one
response the subtrahend and the other response the minuend. This will normally
cancel the main tap, which must be restored.

Restore the main tap. There are a number of approaches to restore the main
tap. A first method is simply to make it 1.0 real and 0.0 imaginary. Another
is to use the main tap of the subtrahend or the main tap of the minuend.
Another method is to use a conservation of energy approach, and subtract a sum
of all other taps energy from unity. This yields a residual energy, and the
main tap is the square root of the residual energy, which should be a value
just under 1.0.

Compute the MTR of the difference with a restored main tap.

**Use Case Examples for Adaptive Equalizer Coefficients **

The following four listed states describe the condition of the plant and the
performance of the measurement devices for different scenarios operators may
encounter in the field.

State 1. Adaptive equalizer tool is working properly and plant is within
acceptable limits. State 2. Adaptive equalizer tool is working properly, and
plant exhibits severe linear distortion.

Plant is stable

Plant is unstable (intermittent or trending) State 3. Adaptive equalizer tool
is working properly, but CMTS/CM is reacting badly

Transmission characteristics in channel have resulted in no solution for CM
coefficients (e.g., a deep suck-out or echo is too long or too severe)

Upstream impulsive noise is causing wrong or unstable adaption.

CM needs to be replaced State 4. Adaptive equalizer tool is not working
correctly because of equipment design or configuration.

CMs are giving wrong MIB data, but working properly. CMs are giving wrong/no
MIB data and not working properly. Wrong configuration of CMs or CMTS.

The CMTS is not configured for adaptive pre-equalization in the upstream

CM includes DOCSIS capable devices STBs and MTAs

Distortion red = static or trending or intermittent

**6.8.1 Use Cases **

The following use cases describe how tools are used. Examples are provided in
the following subsections.

**_6.8.1.1 Use Case 1: In or Near Home Problem Identification _**

**Description **

Support User detects possible service problem by monitoring (proactive) or
trouble call (reactive). Analysis tool is used to interrogate the customer’s
modem and CMTS for performance information. The performance data is analyzed
for radio-frequency reflections to determine approximate problem location.
Location information is used to instruct Support User or dispatch a repair
technician to resolve the problem.

**Level: **User Goal **Primary Actor **

Maintenance User or Support User

**Supporting Actors **

Customer, Repair Technician, Dispatch Personnel, Customer Modem, CMTS

**Stakeholders and Interests **

Customer - may be unaware of service trouble in proactive scenario. Plant
Maintenance - non-critical repair may be scheduled during routine maintenance.
Billing Personnel - billing system accounts may need to be reconciled.

**Pre-Conditions **

Support User must have specific knowledge of a possible service problem.
Customer’s modem must be online. CMTS and customer modem must both support
Adaptive Equalization. Analysis tool must be available to the Support User.

User must have sufficient access and knowledge of using the tool and
interpreting the data.

Impairments to the customer’s signal must be such that the modem can still
respond correctly.

**Post Conditions **

Success end condition

Reactively, the problem was identified and repaired to the satisfaction of the
customer. Proactively, the problem was identified and repaired before the
customer perceived a problem. Customer’s modem and entire node show improved
performance.

Failure end condition

Modem fails to demonstrate any actionable performance metrics. No remediation
of problem, customer may experience recurrence or deterioration of service.

**Trigger **

Proactive alert identifies possible service affecting problem OR reactive
alert, customer calls with trouble.

**Main Success Scenario **

1\. Customer calls with service trouble.

Support User initiates analysis tool, providing customer identification.

Customer identification is used to obtain the modem MAC address and CMTS for
the customer.

MAC address is used to query both the modem and CMTS for performance
information.

Reference SD-PNM200 for software sequence (Appendix VI).

Performance data is analyzed to obtain reflection information if available,
used for distance  calculations.

Support User is presented with customer’s service address and an estimate of
problem distance  from home.

Support User evaluates distance information to determine “in or near home”
problem, escalates  to Dispatch Personnel.

Dispatch Personnel evaluates trouble call information and approves a repair
call.

Repair Technician is provided with analysis and dispatched to the customer
premise.

Repair Technician locates trouble and resolves issue.

**Extensions **

4a. in Step 4, the customer information is not located. • Trouble is escalated
to billing department for account reconciliation.

4b. in Step 4, the modem or CMTS do not support equalization analysis. •
Trouble resolution reverts to conventional process.

5a. in Step 5, analysis data shows no trouble present.

• Customer account is noted for future reference 2. Proactive monitoring is
escalated to a higher rate

5b. in Step 5, customer has multiple devices at premises.

1\. All devices are analyzed for similar distortion characteristics 1a.
multiple devices share distortion - common fault is noted in analysis 1b.
Single device demonstrates distortion - scope of analysis is narrowed to “in
home”

5c. in Step 5, adjacent homes may also be analyzed

1\. All devices within a specified radius are analyzed for similar distortion
characteristics 1a. multiple customer devices share distortion - common fault
is likely to be at or above the tap. 1b. single customer devices demonstrate
distortion - fault is more likely to between the tap and something in the
customer’s home.

**Variations **

1a. in Step 1, proactive monitoring may provide use case trigger. 1b. in Step
1, automations such as an interactive telephone system may provide use case
trigger. 2a. in Step 2, the Support User role may be implemented as an
automated telephone system. 3a. in Step 3, the customer identification may be
any one of MAC, telephone number or account number.

**Frequency **

Use case is executed per each trouble call, day of install or subject to the
frequency of proactive monitoring.

**Assumptions **

Users of the system must have basic knowledge of troubleshooting cable service
problems. Users must have required access and training of the analysis tools.
**Special Requirements **All systems must support authentication and
encryption pursuant to corporate security standards. **Issues **

Distance calculations are preliminary, subject to market specific conditions
and trial findings.

Distance estimates actually describe the distance between two impedance
mismatches  (reflectors). In the case of in or near home, the assumption is
made that one of the reflections is within the subscriber’s home. This may not
always be the case however the majority of the time, this holds correct. There
will be some cases where an outside plant issue may be incorrectly
characterized as “in or near home” problem.

**To do **

Validate use case in arid climates with less water ingress and corrosion.

Track distance estimates with actual problems found to identify opportunities
of improvement in

the distance calculations.

![](PNMPFull.files/image178.png)

![](PNMPFull.files/image180.png)

**6.8.2 Use Case: Upstream Ingress or Noise Detection **

**Description **

Support User detects possible service problem by monitoring (proactive) or
trouble call (reactive). Analysis tool is used to interrogate the customer’s
modem and CMTS for performance information. The performance data is analyzed
for additive influence in the modem transmission.

**Level: **User Goal **Primary Actor **

Maintenance User or Support User

**Supporting Actors **

Customer, Repair Technician, Dispatch Personnel, Customer Modem, CMTS

**Stakeholders and Interests **

Customer - may be unaware of service trouble in proactive scenario. Plant
Maintenance - non-critical repair may be scheduled during routine maintenance.
Billing Personnel - billing system accounts may need to be reconciled.

**Pre-Conditions **

Support User must have specific knowledge of a possible service problem. CMTS
and customer modem must both support Adaptive Equalization. Analysis tool must
be available to the Support User. Support User must have sufficient access and
knowledge of using the tool and interpreting the data.

**Post Conditions **

Success end condition

Reactively, the problem was identified and repaired to the satisfaction of the
customer. Proactively, the problem was identified and repaired before the
customer perceived a problem. Customer’s modem and entire node show improved
performance.

Failure end condition

Intermittent ingress such as impulse may no longer be present. Modem fails to
demonstrate any actionable performance metrics. No remediation of problem,
customer may experience recurrence or deterioration of service.

**Trigger **

Proactive alert identifies possible service affecting problem OR reactive
alert, customer calls with trouble.

**Main Success Scenario **

Customer calls with service trouble.

Support User initiates analysis tool, providing customer identification.

Customer identification is used to obtain the modem MAC address and CMTS for
the customer.

MAC address is used to query both the modem and CMTS for performance
information.  • Reference SD-PNM200 for software sequence. (Appendix VI)

Performance data is analyzed to obtain the distortion present at the CMTS
after equalization.

Support User evaluates performance of all modems on the same node.

Support User determines that only the single customer demonstrates a noisy
response.

Customer is asked to tighten connectors and remove extra cable or splitters.

Support User rescans device for performance information and perceives that the
problem has been resolved.

Extensions 4a. in Step 4, the customer information is not located.

2\. Trouble is escalated to billing department for account reconciliation. 4b.
in Step 4, the modem or CMTS do not support equalization analysis.

2\. Trouble resolution reverts to conventional process. 5a. in Step 5,
analysis data shows no trouble present.

Customer account is noted for future reference

Proactive monitoring is escalated to a higher rate

6a. in Step 6, modems on same node may also be analyzed

2\. All devices sharing the common upstream interface are analyzed 1a.
multiple customer devices share ingress - one or more points of ingress need
to be resolved.

a. Trouble is escalated to Dispatch for maintenance scheduling 1b. single
customer device demonstrates noisy response - likely impedance problem caused
by

loose, damaged or corroded connectors or cable.

**Variations **

1a. in Step 1, proactive monitoring may provide use case trigger. 1b. in Step
1, automations such as an interactive telephone system may provide use case
trigger. 2a. in Step 2, the Support User role may be implemented as an
automated telephone system. 3a. in Step 3, the customer identification may be
any one of MAC, telephone number or account number. **Frequency **

Use case is executed per each trouble call, day of install or subject to the
frequency of proactive monitoring.

**Assumptions **

Users of the system must have basic knowledge of troubleshooting cable service
problems. Users must have required access and training of the analysis tools.
**Special Requirements **All systems must support authentication and
encryption pursuant to corporate security standards. **Issues **

3\. Magnitude of equalized response ripples from the CMTS need to be
correlated to concrete BER / MER values. Pending lab work.

**To do **

3\. Better correlate the perception of “noise” with unstable equalizer
operation. This is reproducible with corrosion.

![](PNMPFull.files/image182.png)

![](PNMPFull.files/image184.png)

**6.8.3 Use Cases 3-11 **

**_Figure 45 - Effects of Ingress When Mapped _**

Plant technician trying to solve a frequency response problem with the
upstream or augment system upstream sweeping. State 2.  Actors: Technician,
NOC  External Event: Distortion red, other indicators yellow/green or plant
sweep shows problem/anomaly  Proactive/High distortion detected Group of CMs
Expected Outcome: Distortion removed

Tech Supervisor: To deploy technicians. Verify technicians got the upstream
frequency response issues resolved. State 2 becoming State 1.  Actors: Tech
Supervisor, Technician External Event: Close out trouble ticket Reactive and
Proactive

Group of CMs

Expected Outcome: Resolved Issue (non-main adaptive equalizer tap or
coefficient energy reduced)

CMTS having issues due to equalization. Unable to compensate for channel.
Micro-reflection too long or no inverse solution, e.g., notch in channel.
Upstream burst noise interfering with the correct ranging of CMs’
coefficients. State 3.  Actors: Technician, NOC, CSR, HE Tech External Event:
Distortion red, other indicators yellow or red Reactive/High distortion
detected Group of CMs Expected Outcome: Fix cause of impairment

QA for accessing a node health score. Goes along with upstream MER (on a per
CMTS port or per CM basis). States 1 and 2.  Actors: Technician, NOC (QA)
External Event: Periodic scan and alarms - Distortion red, other indicators
red/yellow/green Reactive and Proactive/High distortion detected Group of CMs
Expected Outcome: Distortion removed

Identification or location of faults. Combine location technique with GPS data
or plant connectivity data. Accurate micro-reflection time delay is important.
Condition 2. (Subset)

Qualifying an upstream for a wider channel RF bandwidth or higher order
modulation. Qualification can also be done to verify a service level agreement
(SLA). States 1 and 2.  Actors: Initially NOC, then technicians External
Event: Distortion red, other indicators yellow/green Use higher order
modulation and wide bandwidth channel as reference Generally Proactive/High
distortion detected Group of CMs Expected Outcome: Node qualified

9 CSR quick check. See if something abnormal is going on, and if the neighbors
have the same problem. All Conditions

Actors: CSR, Technician External Event: Customer complaint Reactive/High
distortion detected 1 device possible others Expected Outcome: Trouble ticket
or no distortion problem, service call avoided

Trend and Intermittent Issues Tracking. State 1 becoming State 2 Actors: NOC
External Event: Distortion turning red within predetermined period,
significant delta distortion within short time period, other indicators
yellow/green  Proactive/Change in distortion detected Group of CMs Expected
Outcome: Problem identified and located, trouble ticket generated

Resolving flapping problems and unstable equalization solutions. State 3 or
State 4. Actors: NOC  External Event: CMTS not compensating or improperly
compensating for distortion, high uncorrectable FEC statistics, high impulse
noise scenario  Reactive/CMTS change in distortion detected Group of CMs (if
distortion generated), all CMs in node (if impulse generated) Expected
Outcome: Problem identified, located and resolved

**6.9 Post-equalization **

As its name indicates, post-equalization is the process of distortion
compensation after the signal has been received. In the cable environment,
post-equalization has been used mostly in the downstream direction where a CPE
device always receives a continuous signal coming from one location, usually
the headend. That fixed location signal source simplified downstream
distortion compensation implementation using adaptive equalization at the
receiver. In the upstream direction the upstream signals come from multiple
sources. Transmission is bursty and one burst may have suffered a different
distortion from the next because the upstream paths traversed may be
different. A post-equalization approach would require the receiver to
compensate for distortion on a per burst basis. Early in DOCSIS, it was deemed
that a post- equalization approach would be a significant processing burden on
the CMTS, which led to the implementation of the upstream pre-equalization
approach covered in this document. Processing capabilities improvements have
enabled the implementation of per burst equalization which is now common in
CMTSs. The advantages and disadvantages of pre- versus post-equalization are
discussed next.

**6.9.1 Advantages of Pre-equalization **

Reliable diagnostic transmission analysis is enabled by the regular complex
coefficient updates the CMTS equalizer provides to individual cable modems
when adaptive pre-equalization is enabled. The repeated convolution of
coefficients effectively generates a time averaged response of the upstream
channel, which leads to the following advantages:

Reasonably stable per modem equalized MER as reported by either the CMTS or
SNMP Polling

Ability to view all of the linear transmission path characteristics unique to
the individual cable modem due to the complex coefficient impulse response
reported via SNMP MIB query. From the SNMP MIB query one can also compute the
effective unequalized MER in addition to amplitude and group delay
characteristics, as well as enable analysis of micro-reflection conditions for
any given cable modem.

Superior equalized MER capability compared to that provided by post-
equalization when the channel is at the upper edge of the return path
spectrum. The superiority is also a function of the depth of the return path
amplifier cascade

Another advantage of pre-equalization over post-equalization is that
throughput is somewhat higher when pre-equalization is used because there is
no need to equalize the data transmission burst. This is related to the
difference in the length of the data burst preamble.

Pre-equalization is beneficial to virtually all DOCSIS 2.0 and DOCSIS 3.0
services. In some cases there would appear to be some instability or
inconsistency in the metrics being reported when using pre-equalization. Some
causes for such behavior are discussed next.

**6.9.2 Disadvantages of Pre-equalization **

Pre-equalization disadvantages are worth mentioning although they can be
considered minor compared to the advantages.

**Memory **

Operation of pre-equalization has memory associated with the function, and
that memory lives in the convolution of the equalizer updates in the cable
modem. As stated previously there are many benefits to having this function
exist in the cable modem, but there are a few deficiencies as well.

For example, if there is suddenly a major impulse noise event or a change in
ingress characteristics during a station maintenance transmission, when the
CMTS is assessing the equalized impulse response update to send back to any
given modem, there is the possibility that the station maintenance will be
corrupted. That would cause the CMTS equalized impulse update to become
corrupted, and the corrupted update would be transmitted to the cable modem.
The cable modem will convolve the corrupted update, so now that particular
cable modem’s equalized impulse response will no longer be valid for a period
of time.

One weakness of pre-equalization is that the CMTS must be assumed to be
responsible as the final arbiter as to which equalized updates are sent and
which updates are potentially corrupted, and compensate for those differences
in one manner or another. There are indeed many options available to the CMTS
to deal with equalizer corruptions, but that topic is beyond the scope of this
document.

**CM TX Level Increased **

One unfortunate but direct consequence of the transmit pre-equalization
process occurs when there is significant amplitude roll-off present on a given
channel such as at the very end of the cascade, and on the highest available
carrier frequency. A primary function of pre-equalization is to eliminate the
post equalization noise enhancement that occurs when raising the signal power
over a specific portion of the spectrum and thereby raising the flat noise
floor of the receiver right along with it.

Equalizer noise enhancement elimination is the single biggest improvement that
pre-equalization provides over post-equalization, especially when operating
near the upper band edge. Transmit pre-equalization eliminates post-
equalization noise enhancement by hitting the receiver with an ideally flat
spectrum. This happens even as the equalization process compensates for other
impairments such as group delay distortion.

The very act of updating the cable modem to increase the transmit power in the
heavily attenuated or rolloff portion of the spectrum at the expense of
lowering the power in the less attenuated portion of the spectrum eventually
ends up with a perfectly flat response at the input to the CMTS receiver. The
final amount the cable modem may be instructed to increase the transmit level
over the original non pre- equalized transmit signal power is a function of
how much amplitude roll off exists on the channel.

If there is sufficient headroom for the cable modem to increase its upstream
transmit level, then there is no penalty for the significantly improved
performance. If the cable modem does not have sufficient margin to increase
its transmit level to the correct amount then the CMTS will only allow as much
low input signal level to exist as was defined in the CMTS’s operating
configuration.

**6.9.3 Advantages of Post-equalization **

The following summarizes some of the benefits of post-equalization.

**No Memory **

Since post-equalization operation starts off every new data burst from
scratch, there are no pre-stored conditions required. As such, there is no
memory condition to become corrupted from any given error condition.

In other words, while any given post-equalized burst can be corrupted, all
that is lost during that corruption period is that particular burst, and not,
say, multiple bursts until a station maintenance can correct the corrupted
update from the CMTS.

Because the post-equalization process possesses no memory in the operation,
one might argue that the post-equalization mode of operation is potentially
more stable, or the simplicity of the post-equalization process results in a
more stable performance loop over all. This is particularly true in the below
20 MHz frequency range where both ingress and impulse noise are common.

**Lower Cable Modem Transmit Levels **

At the upper end of the return path spectrum there is generally no mechanism
that will result in the post- equalization process requesting more cable modem
transmit level, at least as a result of the equalization process itself. This
is because the post-equalization process requires absolutely no cooperation on
behalf of the cable modem. That is, there is no pre-equalization function
being convolved in the cable modem for post-equalization to work.

A reasonably strong case can be argued for using post-equalization only when
in TDMA or A-TDMA mode below 30 MHz, and definitely below 20 MHz.

**6.9.4 Disadvantages of Post-equalization **

The following summarizes several disadvantages of post-equalization.

Lower throughput than pre-equalization operation due to longer data preamble -
the throughput loss is mostly a small amount compared to FEC correction
capabilities variations, but nonetheless it is measurable.

Poorer equalized MER performance compared to pre-equalization because of the
convergence time required, versus a data preamble length most operators would
be willing to suffer with to attain better equalized MER performance per
burst. Also, given the possibility of multiple impairments being present
during any given data burst, there can be a significant variation regarding
the equalized MER estimate from burst to burst.

Vastly poorer micro-reflection analysis capabilities in part because of
convergence time and in part because of any impairment present during the data
burst.

Equalizer noise enhancement phenomena are unavoidable at the diplex filter
band-edge, and the phenomena become increasingly worse as the amplifier
cascade increases. In other words, in an N \+ 1 or perhaps even up to an N + 3
cascade depth, the equalizer noise enhancement penalty is perhaps a minor
point that could be forgotten. However, as the cascade depth increases to N +
6 or higher, the

equalizer noise enhancement penalty becomes more significant to the point that
the post-equalization mode of operation total available or usable bandwidth on
a given return path becomes much less than when using pre-equalization.

• Generally speaking, much poorer estimate for both amplitude roll-off and
group delay distortion when attempting to extract the information from a
single equalized data burst for any given cable modem.

![](PNMPFull.files/image186.png)

**7 PNM USING FULL BAND CAPTURE **

**7.1 Technical Description of Process **

This section focuses on downstream FBC.

Spectrum analyzers are specialized instruments that provide a graphical
display of amplitude versus frequency. Figure 46 shows a typical spectrum
analyzer display.

![](PNMPFull.files/image188.png)

Spectrum analyzers have been used by cable operators for decades for routine
maintenance and troubleshooting. However, spectrum analyzers are expensive
instruments, so they have not typically been widely available to field
personnel. Technicians could only imagine having a spectrum analyzer in every
home.

FBC is a relatively new concept that takes advantage of low-cost discrete
Fourier transform (DFT) and fast Fourier transform (FFT) technology to support
spectrum analyzer-like functionality in customer premises equipment such as
cable modems.

Integrated spectrum analyzer-like functionality is supported by the latest
Broadcom and MaxLinear CPE silicon. The CPE’s spectrum data can be accessed
remotely using simple network management protocol (SNMP) or similar, allowing
a cable operator to see where ingress or other impairments might be
problematic. Figure 47 shows an example of FBC, in which FM and LTE ingress
are visible.

![](PNMPFull.files/image190.png)

**7.1.1 What Does FBC Do For Operators? **

FBC can be used to remotely troubleshoot a variety of headend, outside plant,
and subscriber drop problems. Since the spectrum analyzer-like functionality
is integrated in the cable modem or other device, it’s much like having a
spectrum analyzer in every home that has FBC-equipped CPE. Figure 48 shows
examples of impairments that can be identified using FBC.

![](PNMPFull.files/image192.png)

Problems can be identified by evaluating the RF spectrum _without rolling a
truck_. If a sufficient number of FBC-equipped devices are available in
subscribers’ homes, it may be possible to determine the approximate location
of the source of a given impairment. A technician can be dispatched directly
to the suspected problem area, simplifying troubleshooting and saving time.

**7.1.2 How FBC Works **

As mentioned previously, a spectrum analyzer is a device which measures the
frequency content of an input signal. Fortunately, this is precisely what DFT
does. Multiplying by the DFT matrix measures the correlation of the input
signal with each row in the DFT matrix, and each row is a sine/cosine of a
particular frequency. Thus, each output bin represents the power of the input
signal at that frequency.

![](PNMPFull.files/image194.png)

Figure 49 shows a block diagram of a digital spectrum analyzer which may
reside in a cable modem or CMTS. The input signal enters at the left of the
diagram; this signal is the full upstream or downstream band of the cable
plant. An analog front end amplifies the signal and provides RF gain control.
A high- speed analog-to-digital converter (ADC), typically 2.5 giga-samples
per second (Gsps) or higher, provides digital samples of the signal. A digital
tuner, consisting of a digital oscillator and lowpass filter, selects the
desired analysis band around a specified center frequency. The signal from the
selected band is applied to the FFT, which multiplies the signal by the DFT
matrix. Each bin of the FFT output comprises a complex value consisting of two
numbers, real (I) and imaginary (Q), giving the correlation of the input
signal with the particular frequency corresponding to a single row of the DFT
matrix. Typically a spectrum analyzer is only concerned with the magnitude,
not the phase, of the FFT output. So, the power (magnitude-squared) of each
bin is computed, that is, I2 \+ Q2 for each bin. If spectrum smoothing is to
be applied, the previously-described process is repeated with a fresh set of
data from the same band, and the power values from several captures are
averaged at each bin location. The smoothed bins are converted to decibels by
taking 10*log10 of each bin power value. These decibel values, one for each
frequency bin, are displayed as the spectrum of the input signal.

Note that if the entire band is able to be processed as a single analysis
band, the tuner shown in Figure 49 is not necessary. However, if the band is
being analyzed in segments, then the tuner is used to step through a sequence
of analysis segments of the band, and the individual spectrum segments are
spliced together to produce the overall wideband spectrum.

**7.2 Field examples and screen shots **

This section includes several examples of FBC screen shots as “seen” at the
cable modem. The horizontal axis in each figure is frequency in MHz, and the
vertical axis is in dB. Images are courtesy of Comcast.

**7.2.1 Ingress **

Technicians can look at a captured spectrum display for indications of the
presence of downstream ingress (and in some cases, direct pickup). If a
sufficient number of FBC capable devices are available, it may be possible to
roughly isolate the area of plant where the ingress is entering the network.
Figure 50 shows an example of visible ingress in the FM band (left edge of
figure) as well as in the LTE band (near the right end of the figure).

![](PNMPFull.files/image196.png)

**7.2.2 Multiple problems **

Figure 51 shows a FBC from one modem, in which multiple downstream impairments
can be seen

![](PNMPFull.files/image198.png)

The most serious problem is the suckout (notch) visible between 697 MHz and
731 MHz. The suckout, which is about 18 dB deep, affects a half dozen QAM
channels. Another problem evident in the display is called adjacency, where a
group of eight channels in the roughly 600 MHz to 650 MHz range are several dB
higher than other channels in that part of the spectrum, likely caused by
incorrect narrowcast injection levels. A third problem is a QAM channel near
563 MHz that is a few dB lower than the adjacent channels. A fourth problem
also is level-related, in the vicinity of 250 MHz.

**7.2.3 Displaying Multiple Modems **

It is possible to simultaneously display an overlay of spectrum data from
multiple cable modems - say, modems in the same neighborhood. Figure 52
illustrates this.

![](PNMPFull.files/image200.png)

Standing waves, also known as amplitude ripple, are caused by impedance
mismatches in the RF signal path. Standing waves are usually easy to see in a
FBC display. Figure 53 shows several examples of standing waves. Of particular
interest is the combination of two standing waves in the lower right screen
shot.

![](PNMPFull.files/image202.png)

**7.2.4 Presence of filters **

Figure 54 includes two examples where filters are present in subscriber drops.
The upper trace in the figure shows the effects of a bandstop filter (an
adjacency problem is visible at two locations in the

![](PNMPFull.files/image204.png)

**7.2.5 Rolloff **

Rolloff is a non-flat loss of signal level-versus-frequency at or near the
lower or upper end of the RF spectrum. When rolloff occurs at the upper end of
the downstream spectrum, the cause can be active device misalignment, active
or passive device damage, presence of older cable or equipment in the network
designed for a lower upper frequency limit than the network’s existing
operating frequency range, and so on. Figure 55 shows examples of rolloff at
the upper end of the downstream spectrum.

![](PNMPFull.files/image206.png)

**7.2.6 Tilt **

**_Figure 55 - Rolloff at the Upper End of the Downstream Spectrum _**

Tilt describes the condition where signal levels vary from low to high in a
more or less linear manner as frequency increases (positive tilt), or from
high to low in a linear manner as frequency increases (negative tilt).
Depending on the location in the plant, tilt may be desirable - for example,
at the output of an amplifier. Ideally the frequency response at the input to
CPE should be flat, but in some cases the response may be tilted excessively
for a variety of reasons. Figure 56 shows examples of negative and positive
tilt.

![](PNMPFull.files/image208.png)

**7.2.7 Resonant Peaking **

Resonant peaking affects a relatively narrow frequency range, typically no
more than a handful of channels. The peaking can exist anywhere in the
spectrum, and typically occurs in an active or passive device. Vibration and
temperature changes may affect the nature of the peak: The response peak can
be intermittent, change in level and/or shape, and move around in frequency.
Examples of causes include defective components, cold solder joints, loose
modules (or module covers), loose or missing screws, and so forth. Figure 57
highlights examples of resonant peaking.

![](PNMPFull.files/image210.png)

**7.2.8 Making It Work **

**_7.2.8.1 How to Capture Data from Devices Equipped with FBC Functionality _**

_7.2.8.1.1 Design Considerations _

Capturing spectrum information requires SNMP read/write access to the cable
modems, which generally are on RFC 1918 address space. This means that direct
access from a workstation is unlikely. In general, implementations will
consist of a server (or servers) that has access to the non-routable IP
addresses used by the modems, and has an external IP address or a static
network address translation (NAT) that allows external clients access to it so
that the server can make the SNMP requests on behalf of the clients. The
clients could be web based, mobile, or desktop software. An operator likely
will already have one or more OSS servers that fits these requirements, but
the existing servers may or may not have sufficient capacity for the
additional load. Additionally, the implementation of FBC will be done for a
somewhat different operational group - and in many cases a different
department -- than the primary OSS users, since field technicians are going to
be much more likely to use this data than some of the other normal OSS tools.
A good exercise is taking a look at how field technicians currently use their
hand held meters, as well as thinking about other uses for a remote spectrum
display that aren't practical today.

There are several considerations that development teams need to understand
before getting started. Security is a large issue for this kind of system,
because it is necessary to perform SNMP SET operations to enable the capture,
and have access to parts of the network that aren't normally reachable. Some
sort of server side authentication system should be used to ensure that only
authorized users can access and use the server. In some cases the FBC requests
will be coming from devices over untrusted networks, such as field technicians
using tablets or smart phones. This could be resolved by requiring virtual
private network (VPN) connections before allowing usage, or with strong
authentication coupled with transport layer security (TLS) or other
encryption. Locking and session management are also needed, because having
multiple users trying to perform a capture on the same device can cause issues
for that device. Other multiple user issues could occur if the device changes
frequency or some other variable in response to one user while another is
trying to interpret results for a different setting. An important
consideration is how to deal with the data. In general, a maximum granularity
capture across the widest window will generate a 10-20 kbps stream of data. By
itself this isn't a large data stream, but it does mean that it's not
practical for most organizations to collect this data for all modems and then
store the information in a database for analysis the way that is typically
done for OSS functions. If a user is only going to work on a real time display
then this consideration isn't particularly problematic, but if the data is for
proactive analytics then it's a large challenge.

**7.3 Method to Find a Time Response from an IFFT when Phase Data is Not Available **

The FBC is used by cable modems and set-top boxes to provide magnitude-only
spectral data about RF path conditions in a remote location, such as a home.
In some cases, the downstream channels being monitored are digital channels,
such as 64- or 256-QAM. In other cases the signals are analog signals or noise
and ingress.

This method applies to blocks of QAM signals to identify the existence of an
echo tunnel that causes ripple in the frequency response. See `

**7.3.1 Method: **

Pick a block of averaged (smoothed) contiguous digital signals, as many as
possible. For example, each 7.5 MHz block of frequency domain data may have
256 spectral components, and multiple blocks are pasted together to make a
wide spectral response.

Extract samples from the lower band edge of the lowest QAM signal to the upper
band edge of the highest QAM signal, and convert the values into linear
values. Use these values as I (in-phase) components.

Use zeroes for all Q (quadrature) values.

If necessary zero-pad the values to fill out a 2^n IFFT transform, such as
16,384 or 4096.

Optionally, a window should be applied to the data.

A frequency region with another signal, such as an analog RF carrier, or
vacant band can be filled  in with a straight line connecting the channel just
above the vacant band to the channel just below  the vacant band.

Perform an IFFT to put the data into the time domain.

Transformed data will be symmetrical due to not providing quadrature values.
You can discard the  image.

A DC term will be present. Comb teeth will be present every 166.67 ns due to
the notch between 6  MHz channels.

If there is an echo in the frequency response, there will be a ripple in the
frequency domain. The  ripple will linearly transform to an impulse located
among the comb teeth. If the echo is an exact multiple of 166.67 ns, it cannot
as easily be observed. The delay between the main impulse and echo is the
round trip time of an echo tunnel, corrected for velocity of prorogation
velocity of cable. Since you know the shape of the teeth on the comb, they can
be removed by subtraction.

This method is valuable because the wide bandwidth of the multiple QAM signals
makes for exceedingly accurate time resolution, so the cable operator makes a
hole to repair a buried cable, not a trench.

Another anticipated method to remove effect of the notches between carriers is
to interpolate over the notches. Yet another method to reduce the effect of
the notches is to equalize the magnitude response, but equalization cannot go
all the way to zero due to negligible energy in the notch.

This method could also work with analog spectrum analyzers, for example, using
GPIB or other interface technology supported by the analyzer to extract the
magnitude data.

Note that it should not work to detect group delay problems, since there is no
phase information available.

The code to do this is in the CableLabs Spectrum Impairment Detector (SID)
which is in the PNM repository.

![](PNMPFull.files/image212.png)

![](PNMPFull.files/image214.png)

**8 CPD DETECTION **

**8.1.1 Common Path Distortion Detection **

**_8.1.1.1 Description of CPD _**

Common path distortion (CPD) is a class of nonlinear distortions most often
observed in the upstream RF spectrum. The interference results from cable
signals mixing with each other and producing difference frequencies, and can
be caused by both analog and digital signals, or any combination thereof. Both
downstream and upstream signals can participate in the mixing process, however
in current 5 MHz to 42 MHz upstreams, the return path contribution is far less
than the forward path contribution. CPD is usually generated in corrosion that
behaves like a diode or semiconductor P-N junction somewhere in the
transmission path that is common to both the forward and return path, hence
the name “common path distortion.” Section 4 defines CPD as follows:

Common Path Distortion (CPD) - Clusters of second and third order distortion
beats generated in a diode-like nonlinearity such as a corroded connector in
the signal path common to downstream and upstream. The beats tend to be
prevalent in the upstream spectrum. When the primary RF signals are digitally
modulated signals instead of analog TV channels, the distortions are noise-
like rather than clusters of discrete beats.

In downstreams with all-analog channel lineups, or at least a significant
number of analog TV signals, the beat-like mixing products of CPD look
somewhat like the visual or aural carriers of an analog TV signal. The
individual beats are wider than the original carriers because of frequency
instability and the action of mixing itself. They form a distribution of beats
based on the spacing and center frequencies of the downstream channel plan.
Some beats may be grouped into clusters that are spaced 12.5 kHz or 25 kHz
apart that result from frequency offsets required in aeronautical bands. In
all-digital cable networks, CPD looks like a raised noise floor with a
structure that is dependent on the type of nonlinear behavior, that is, even
or odd order mixing products, associated with the diode-like character of the
corrosion. In this section, an updated view of CPD in cable networks with
digital signals, including QAM and OFDM types, is discussed, as are challenges
and potential approaches for detecting and characterizing CPD in all-digital
networks using PNM technology.

The corrosion that leads to the P-N junction or ‘diode-like’ behavior can
occur anywhere there is a discontinuity in the signal path, whether
intentional or unintentional. Unintentional discontinuities include squirrel
chews, physical damage, and so on. Intentional discontinuities include where
the stingers of coax hardline are connected to RF amplifiers or taps, or even
within an amplifier circuit. The corrosion can be the result of moisture
getting into the connector point. In some very early equipment designs, two
different types of metal were used for contacts, resulting in an
electrochemical reaction between the two metals that encouraged corrosion. In
either case, an oxide layer - which may be only a few molecules thick - builds
up at the contact point, and behaves somewhat like a diode. The presence of
downstream signals at the diode-like corrosion-based “mixer” results in the
generation of various second- and higher-order distortions. Since these mixing
products are difference frequencies, they most often are observed in the
return spectrum, but they can also be observed in the downstream spectrum for
large enough frequency differences between the individual channels.

Consider first the form of CPD in cable systems with all analog downstream
signals. In a cable network with a large number of analog NTSC TV signals,
CPD’s second order beat clusters result from the differences between the
visual carriers of the downstream channels, and also from the differences
between aural carrier of the downstream channels. In North America and other
regions that use 6 MHz spacing between downstream channels, the mixing
products appear every 6 MHz: 6, 12, 18, 24, 30, 36 MHz and so on. In Europe
and other regions using 8 MHz channel spacing, the mixing products appear
every 8 MHz: 8, 16, 24 MHz, and so on. Third order distortions result in other
frequencies that are formed by the difference between one carrier frequency
and two times another carrier frequency and thus produce beats at 9, 15, 21,
27, 33 and 39 MHz, for a North American or other system with 6 MHz downstream
channel spacing [Howard NCTA]. Because of the mixing of aural and visual
carriers, additional beats can appear at 1.25 MHz on either side of the 6 MHz-
spaced second order distortion beats.

Figure 60 shows a low resolution spectrum analyzer display of CPD with both
second- and third-order beats every 6 MHz. Each group of beats has three
components: The second-order beats are the middle (and typically taller) beat
cluster in each group, and the third-order beats are the shorter beats on
either side of the second-order beats. The actual appearance of CPD beats in a
cable network’s upstream spectrum depends on the nature of the diode-like
junction that is generating the beats. In some cases only second-order beats
appear, sometimes only third-order beats appear, and sometimes both types are
visible, as shown in Figure 60.

![](PNMPFull.files/image216.png)

A higher resolution view can be produced using a spectrum analyzer or other
monitoring technology with a suitably narrow resolution bandwidth, or by
capturing the upstream with a digital sampling oscilloscope or real time FFT
analyzer. These captures reveal much more structure in the CPD that is due to
not just the difference frequencies between visual carriers, aural carriers,
or combinations thereof, but also the beat clusters caused by frequency
offsets for aeronautical band operation and even the variations in downstream
carrier frequencies. Figure 61 and Figure 62 show this detailed CPD structure.

![](PNMPFull.files/image218.png)

**_Figure 61 - Detailed Structure of CPD Captures Showing Difference Frequencies Around Beats at 24 MHz _**

![](PNMPFull.files/image220.png)

**_Figure 62 - Detailed Structure of CPD Captures Showing Difference Frequencies Due to 12.5 And 25 KHz FAA Offsets for Aeronautical Band Operation_**_3 _

Note that there may be a raised noise floor due to the QAM nonlinear products,
as will be seen next.

In cable networks with all-digital downstreams, it can be more difficult to
detect CPD because it lacks the narrowband structure of CPD from analog
signals. With digital downstream signals, the mixing products are lower in
power spectral density and spread out and form a raised noise-like floor that
may nonetheless have some structure that can be seen in upstream RF spectrum
captures. There is a CPD from analog downstream signals is therefore
narrowband and of a known structure, and can be easily detected using upstream
RF spectrum captures and observing specific beat frequencies known to result
from CPD. When the downstream spectrum has both analog and digital signals, it
is still possible to detect CPD using this approach, since the analog carriers
will continue to produce the same misconception that in a mostly- or all-
digital network, CPD disappears; however it doesn’t go away, it just takes on
a different appearance. An example of CPD caused by digital downstream signals
is shown in Figure 63.

To understand how the structure arises for CPD from digital signals, it is
easiest to develop the CPD structure in the frequency domain using the
convolution theorem from Fourier analysis, whereby multiplication in the time
domain can be represented as convolution in the frequency domain, and vice
versa. So a second order CPD nonlinearity means the signal is multiplied by
itself or squared in the time domain, which is like convolving its spectrum
with itself in the frequency domain. Convolving a QAM haystack with itself
produces a triangular shaped resulting spectrum that is twice the bandwidth of
the original QAM haystack.





**_Figure 3. CPD in a network with both analog and digital downstream signals. Yellow marks show the gaps between each QAM signal-like beat. Image courtesy of Viavi _**

**_Solutions (formerly JDSU)_**

**_ _**

![](PNMPFull.files/image222.png)

**_Figure 63 - CPD In A Network With Both Analog And Digital Downstream Signals. Yellow Marks Show The Gaps Between Each QAM Signal-Like Beat. Image Courtesy Of Viavi Solutions (Formerly JDSU) _**

The actual QAM downstream spectrum is a sequence of QAM haystacks with small
gaps in between them. In this case, the convolution of two QAM ‘trains’ of
spectra produces a periodic CPD spectrum of peaks that correspond to
difference frequencies where the QAM haystacks are in alignment. Figure 64
shows this expected CPD behavior for all-digital downstreams. Note the peaks
at 6, 12, 18, 24, 30, 36 and 42 MHz.

![](PNMPFull.files/image224.png)

**_Figure 64 - Second Order Modeled CPD Behavior From All-Digital Downstreams (Not Scaled. _**

When there are both analog and digital downstream signals, the analog carriers
effectively sample the QAM haystacks during the convolution process, thereby
reproducing them in the second order CPD spectrum. This results in reproducing
the QAM haystacks themselves, and the gaps between them every 6 MHz in the CPD
spectrum, as seen in Figure 63.

As an example of the combination of full band RF capture capabilities with a
CPD model based on convolution of spectra, Figure 65 shows an example RF
spectrum capture using PNM technology in a node

that was suspected of having nonlinear behavior. Figure 65 shows just the
upstream RF frequency band of this capture, which highlights the structure of
the upstream RF band.

![](PNMPFull.files/image226.png)

**_Figure 65 - Full Band RF Capture From Example Node With Suspected Nonlinearity, Entire Spectrum _**

![](PNMPFull.files/image228.png)

**_Figure 66 - RF Capture From Example Node, Upstream Band Only _**

Figure 67 was produced by taking the RF capture and convolving it with itself
and then convolving it with the first convolution to produce a 3rd order CPD
spectrum in the manner described in Howard [NCTA 2001 paper]. The overall
structure in Figure 67 is well reproduced by the convolution model of CPD
using full band RF capture data with PNM technology.

![](PNMPFull.files/image230.png)

**_Figure 67 - Simulated 3rd Order CPD Nonlinearity From Example Node (Not Scaled) _**

**_8.1.1.2 Detecting CPD _**

The most common method used by cable operators to detect the presence of CPD
is with a spectrum analyzer or a return path spectrum monitoring tool. If a
CMTS is equipped with upstream spectrum analysis functionality, it can be used
to detect the presence of CPD. As of this date, PNM tools do not support the
automatic detection and identification of CPD, however discussions are
underway for the potential development of such tools, and the previous
modeling results point to the potential for PNM technology, specifically full
band RF capture technology, to be used for CPD detection.

One way to detect CPD is when it results from the difference frequencies of
CW-like carriers in the downstream. For example, ANSI/SCTE 109 2010 “Test
Procedure for Common Path Distortion (CPD)” details a method for measuring CPD
in a lab setting.4 It is also possible to adapt the test procedure for use in
an operating cable network, by injecting two downstream CW carriers at a known
frequency separation that would produce a second-order difference beat in the
upstream spectrum equal to the frequency separation of the two downstream test
carriers. If there is already an existing CW carrier in the downstream for,
say, leakage monitoring, then only a single additional CW carrier need be
injected.

One challenge with this approach may be finding available downstream spectrum
for the two test carriers such that the difference frequency falls in an
unused part of the upstream spectrum, however there are a couple ways to
accomplish this. First, there may be a CW carrier already in use on the
downstream for leakage monitoring. For example, if there is an existing CW
carrier at 139.25 MHz (for monitoring leakage in or near the VHF aeronautical
band) and the FM band is clear, a second carrier could be injected in the FM
band to test for CPD beat products in the upstream. Alternately, if a signal
level reference carrier is present at, say, 859.25 MHz, it could be used if
the spectrum at around 40 MHz above or below it has a gap where injection of a
second carrier would be non-interfering.

This procedure was performed on a live plant, where an additional CW carrier
was injected at visual carrier level at 818.75 MHz (since this frequency
happened to be vacant) to be used with another CW carrier that already existed
at 859.25 MHz. The carriers mixed in the plant and produced a second-order CPD
difference frequency at 40.5 MHz. Figure 68 shows the resulting CPD mixing
product at 40.5 MHz from this two-tone nonlinear distortion.

![](PNMPFull.files/image232.png)

**_Figure 68 - Active CPD Measurement Technique Whereby an Injected Carrier Is Used To Produce a 2_****_nd _****_Order Difference Frequency of 40.5 MHz _**

Finally, to determine the actual location of the CPD in the plant, two methods
are possible. First, a third- party CPD detection and troubleshooting tool is
available from at least one vendor.5 The troubleshooting

tool produces a highly accurate time delay associated with a round-trip
distance to the source of the impairment, thereby enabling the determination
of the actual location of the CPD impairment. It does so by using a passive
radar-type approach and an associated correlation process to detect CPD and
determine the distance to the impairment source.

Here is how it works: Test equipment is connected to a network test point, and
as QAM channels propagate through the network and pass the connection point,
the “radar” captures samples of the QAM channels, and presents the samples to
a built-in CPD simulator such that a CPD reference signature is created at the
connection point of time = 0. The QAM signals continue to propagate through
the network, and when they pass through a source of CPD, intermodulation
products will be created at many frequencies. Some of the intermodulation
products will travel back via the return path, and importantly, the spectral
characteristics of the intermodulation signal will be the same as the
reference signal generated at the connection point. The passive radar then
looks at the return signals as they pass by the connection point - and
performs a correlation process whereby the reference signal is time shifted a
few thousand times, and compared to the return signal. At some time delay the
two signals will be statistically the same (correlated), and with certainty
the source of the CPD will be located at half of that time delay distance. The
time distance is then easily converted to the linear distance and the distance
to the source is identified.

Since the correlation process essentially integrates the signal in time
(analogous to video averaging on a spectrum analyzer), the noise floor of the
measurement is significantly below the cable network noise floor. As such,
impairments that may not yet be visible on a return spectrum analyzer in the
form of an elevated noise floor (digital CPD) or recurring 6 MHz or 8 MHz
spikes (analog CPD), are identifiable and can be located and mitigated. The
first screen capture in Figure 69 shows an example of CPD which is not yet
affecting the network performance, and the second screen shot shows the same
source only two hours later, where the CPD level increased by 26 dB such that
it now affects network performance and is deteriorating the return channel
MER.

Since the source of CPD most often also creates an impedance mismatch, it is
possible to use PNM technology to locate the impairment in some cases where
this is an echo cavity created by the CPD source and another impedance
mismatch.

![](PNMPFull.files/image234.png)

**_Figure 69 - Radar-Correlation Based CPD Detection (Courtesy Of Arcom Digital) _**

CPD continues to be of interest to cable technical personnel for two reasons:
First, it continues to occur and when severe enough, it can affect the entire
upstream and degrade performance. Second, as even higher orders of modulation
for the upstream are considered, especially as DOCSIS 3.1 is deployed, what
was an acceptable amount of CPD in the past may not be acceptable in the
future. This is even more important in all-digital plants since the broadband
noise-like behavior of CPD cannot be easily mitigated, even by DOCSIS 3.1’s
OFDMA technology. The good news is that cable operators who have deployed PNM
technology at scale, and aggressively fix the plant issues detected by PNM
technology, report that CPD is less of a concern now; by finding micro-
reflections in the network and fixing them proactively, the incidence of
serious CPD appears to be on the decline.

For more information on CPD causes and a description of it in analog-only
plants, see “Characterisation of Common Path Distortions” by Barry Patel,6 and
for the detailed structure of CPD and modeling of it, see

“Detection and classification of RF impairments for higher capacity upstreams
using advanced TDMA,” by Daniel Howard.7

**9 CONCLUSION **

This best practices and guidelines document covers different aspects of
network maintenance that rely on upstream pre-equalization and FBC to
proactively maintain the CATV network. Even though the initial purpose of this
effort was to implement a network maintenance strategy that is able to take
corrective action before service is impacted, the outcome of this effort has
also proven to be very powerful in implementing and optimizing numerous
“reactive” maintenance tasks present in day to day operations. Reactive
maintenance is defined here as maintenance triggered by any perceivable
deterioration in service performance.

Linear distortion including two types of micro-reflections and group delay
distortion have been discussed in detail, as well as the ranging process that
CMTS and CM go through to sound the upstream channel and compute the
equalization coefficients. From these parameters the CM information indicates
the estimated distortion in the upstream path while the CMTS indicates the
extent to which the distortion compensation of the upstream path of a CM has
been completed.

Interpretation of the CM/CMTS MIB data has been provided including the
implementation details of a universal decoder that translates all known CM MIB
interpretations.

This document describes how to take advantage of pre-equalization analysis
both in the time and frequency domains. Other topics covered here include
scalable data collection approaches; distortion compensation capabilities of
DOCSIS pre-equalization; pre-equalization calibration techniques, which
included the details of a short reference plant; severity assessment for
static, trending and intermittent distortion environments; definitions of key
equalization metrics; extrapolation of coefficients for neighboring channels;
and use of FBC for troubleshooting plant problems.

Additional supporting information can be found in the Appendices.

A key outcome of this effort is the fault localization processes to pinpoint
the problem location which leads to reduced mean time to repair and improved
reliability. This is obtained through the correlation of the CATV network
topology with the impairment-unique characteristics derived from the CM pre-
equalization data.

This gathered knowledge has been leveraged to implement use cases describing
guidelines to resolve proactive as well as reactive operational, engineering
and maintenance issues.

Even though the emphasis here has been on leveraging pre-equalization,
incorporation of additional metrics and the correlation among metrics will
increase the efficacy in troubleshooting network problems.

**Appendix I Tutorial ****I.1 Nonlinear Distortions **

Active devices such as amplifiers and optoelectronics are devices that do not
operate perfectly linearly. For example, the RF signals at the output of a
perfect amplifier would be identical to the input signals, but at a higher
power level. The RF signals at the output of a real-world amplifier are
increased to a higher power level and are almost identical to the input
signals, but are distorted somewhat by nonlinearities in the amplifier.
Nonlinear operation in an amplifier is caused by small-signal nonlinearities
in the active device’s semiconductors, and by signal compression that takes
place as higher RF output levels reach the amplifier’s saturation point. All
of this means that a real-world amplifier’s output includes both the amplified
signals and distortions. As the amplifier’s RF output level is increased to
even higher amplitudes, the distortions get worse (think of a stereo that
distorts the sound as the volume is turned up too high).

Nonlinear distortions of most interest to equipment manufacturers and cable
operators include even order distortions such as composite second order (CSO),
odd order distortions such as composite triple beat (CTB), and cross
modulation (XMOD). One might think that as an amplifier’s RF output level
changes by, say, 1 decibel (dB), the amplitude of the distortions also would
change by 1 dB. But they do not.

CSO distortion amplitudes change by 2 dB for every 1 dB change in the
amplifier’s output level, while CTB distortion amplitudes change 3 dB for
every 1 dB change in the amplifier’s output level.8 Nonlinear distortions get
their name in part because of the “nonlinear” 1:2 and 1:3 signal-to-distortion
relationship, as well as from the fact that the distortions are a function of
the active device’s inherent nonlinear operation. As RF output levels approach
or reach the active device’s saturation threshold, the distortion amplitudes
may begin to change at ratios other than the expected 1:2 or 1:3.

The tendency is to think of nonlinear distortions coming primarily from active
devices whose output levels are too high, as just discussed. Common path
distortion (CPD) is an interesting class of nonlinear distortion in that it’s
often generated in a diode-like junction somewhere in the transmission path
that is common to both the forward and return, hence the name common path
distortion. The culprit is typically corrosion of some sort, where the
corrosion’s oxide layer itself-which may be only a few molecules thick-behaves
somewhat like a diode. As you know, diodes are used to make electronic mixer
circuits. The presence of downstream signals at the diode-like corrosion-based
“mixer” results in the generation of various second- and third-order
distortions. Many of those distortions appear in the return spectrum. For
instance, in an NTSC network, CPD’s second order beat clusters may appear
every 6 MHz: 6, 12, 18, 24, 30, 36 MHz and so on. Third order distortions may
appear 1.25 MHz either side of the 6 MHz-spaced second order distortions.
Sometimes only the second order distortions are present, sometimes only the
third order distortions are present, sometimes both are present, and sometimes
CPD manifests itself as an elevated noise floor.

In some circumstances the mechanism that generates CPD may also be a
noticeable impedance mismatch that creates a micro-reflection.

Nonlinear distortions can be generated in a cable network’s passive devices,
separate from the mechanism that creates CPD. One example is passive device
intermodulation, which occurs when excessive RF levels saturate the ferrite
material in, say, drop splitter toroidal transformers (the ferrite material
generally must have some residual magnetism present). Newer passive designs
minimize passive device intermodulation. Nonlinear distortions create
frequency components at new frequencies, harmonics being one example.

**I.2 Linear Distortions **

Linear distortions include impairments such as _micro-reflections_, _amplitude
ripple/tilt_, and _group delay_. Linear distortions comprise a class of
impairments that from a general perspective maintains a linear signal-to-
distortion amplitude relationship. For example, if an impedance mismatch
creates a micro- reflection, the amplitude of the reflection relative to the
incident signal remains constant as the incident signal’s amplitude changes.
That is, if the incident signal’s amplitude changes 1 dB, the amplitude of the
reflection also will change 1 dB. This is in contrast to nonlinear
distortions, where a 1 dB signal change results in a distortion amplitude
change of 2 or 3 dB. Linear distortions are not capable of creating frequency
components at new frequencies.

Amplitude ripple/tilt, group delay, impedance mismatch, and micro-reflection
are discussed in other sections of this tutorial.

**I.3 Frequency Response **

Cable industry technical personnel have for decades used broadband sweep
equipment comprising a sweep transmitter and sweep receiver to align and
maintain the outside plant’s active devices. In its simplest configuration, a
sweep transmitter transmits a test signal that has constant amplitude versus
frequency. The transmitted signal’s frequency is varied over a frequency range
of interest-for instance, the 54-870 MHz downstream range. The sweep receiver
recovers the transmitted sweep signal, and plots the sweep signal’s amplitude-
versus-frequency on the receiver display. The latter shows a graphic
representation of the cable network’s frequency response. It’s important to
note that frequency response is a complex quantity that has two components:
amplitude (magnitude)-versus-frequency, and phase- versus-frequency. Broadband
sweep equipment displays only amplitude-versus-frequency, the latter more
generally known as frequency response in cable industry vernacular.

Ideally, amplitude-versus-frequency response should be flat, and phase-versus-
frequency response should change linearly with frequency.

What happens when amplitude-versus-frequency deviates from ideal? The result
may be amplitude ripple (standing waves), amplitude tilt (slope), or some
combination of the two. When phase-versus-frequency deviates from ideal, the
result is group delay. Refer to the Amplitude Ripple, Amplitude Tilt, and
Group Delay tutorial sections for more information.

**I.4 Group Delay **

Consider the 6 MHz spectrum occupied by an NTSC analog TV channel or digitally
modulated signal, the 5- 42 MHz upstream spectrum, or any specified bandwidth
or passband as the equivalent of a bandpass filter. A signal takes a certain
amount of time to pass through a filter. The finite time required for a signal
to pass through a filter-or any device for that matter-is called delay.
Absolute delay is the delay a signal experiences passing through the device at
some reference frequency.

In many instances the delay through a filter varies with frequency-that is,
the delay may be less in the center of a filter’s passband, but greater near
the filter’s band edges. Indeed, if delay through a filter is plotted on a
graph of frequency (x-axis)-versus-time delay (y-axis), the plot often has a
parabola- or bathtub-like shape, as shown in Figure I-1. The group delay on
the low end (e.g., 5 MHz) is typically caused by lightning protection filters,
and the group delay on the high end (e.g., 40 or 42 MHz) is typically caused
by the low pass section of a diplex filter.

![](PNMPFull.files/image236.png)

**_Figure I-1 - A Filter's Time Delay-Versus-Frequency Curve Often Has A Bathtub Shape _**

If propagation or transit time through a device is the same at all
frequencies, phase is said to change proportionally with respect to frequency.
If phase changes proportionally with frequency, an output signal will be
identical to the input signal-except that it will have a time shift because of
the uniform delay through the device. If propagation or transit time through a
device is different at different frequencies, the result is delay shift or
nonlinear phase shift. If phase does not change proportionally with frequency,
the output signal will be distorted.

Delay distortion-also known as phase distortion-is usually expressed in units
of time: milliseconds (ms), microseconds (μs) or nanoseconds (ns) relative to
a reference frequency.

Phase distortion is related to phase delay, and is measured using a parameter
called envelope delay distortion, or group delay distortion.

According to the _IEEE Standard Dictionary of Electrical and Electronics
Terms_, group delay is “the [negative] derivative of radian phase with respect
to radian frequency. It is equal to the phase delay for an ideal non-
dispersive delay device, but may differ greatly in actual devices where there
is a ripple in the phase versus frequency characteristic.”9

Group delay is expressed mathematically as

_GD _= − _d_φ _d_ω

where _GD _is group delay in seconds, _φ _is phase in radians, and _ω _is
frequency in radians per second.

Translation? If phase-versus-frequency response does not change in proportion
to frequency, group delay exists. In a system, network, device or component
with no group delay variation or group delay distortion, all frequencies are
transmitted through the system, network, device or component in the same
amount of time-that is, with equal time delay. If group delay distortion
exists, signals at some frequencies travel faster than signals at other
frequencies.

Group delay distortion exists if phase-versus-frequency deviates from ideal.
But just what does that mean? As an example, using a 100 ft. piece of .500
feeder cable, hardline coax installed in cable networks for feeder
applications has a velocity of propagation of around 87% (refer to the
tutorial section on Velocity of Propagation for more information). The speed
of light in free space or a vacuum is 299,792,458 meters per second, or
983,571,056.43 feet per second-1 foot in about 1.02 ns.

In coaxial cable with a velocity of propagation of 87%, electromagnetic
signals travel at a velocity equal to 87% of the free space value of the speed
of light. That works out to 260,819,438.46 meters per second, or
855,706,819.09 feet per second-1 foot in about 1.17 ns.

So, electromagnetic signals will travel 100 feet in a vacuum in 101.67 ns, and
through a 100 ft. piece of coax in 116.86 ns.

Wavelength (λ) is the speed of propagation of an electromagnetic signal
divided by its frequency (f) in hertz (Hz). It is further defined as the
distance a wave travels through some medium in one period of an
electromagnetic signal, or the distance over which a wave’s shape repeats. The
period (T) of an electromagnetic signal (in seconds) = 1/f, that is, the
reciprocal of the electromagnetic signal’s frequency in Hz. In a vacuum,
wavelength in feet (λft) = 983,571,056.43/fHz, which is the same as λft =
983.57/fMHz. In coaxial cable with 87% velocity of propagation, λft =
855,706,819.09 /fHz or λft = 855.71/fMHz.

For instance, the period of a 10 MHz sine wave is 1/10,000,000 Hz = 1x10-7
second, or 0.1 μs. That means a 10 MHz signal takes 0.1 μs to complete one
cycle, or 1 second to complete 10,000,000 cycles. In a vacuum an
electromagnetic signal travels 98.36 ft. in 0.1 μs. This distance is one
wavelength in a vacuum for a 10 MHz signal. In 87% velocity of propagation
coax, the 10 MHz signal travels 85.57 ft. in 0.1 μs. This distance is one
wavelength in coax for a 10 MHz signal.

By calculating a given frequency’s wavelength in feet, it can be said that a
100 ft. piece of .500 coax is equivalent to a certain number wavelengths at
that frequency! From the previous example, it stands to reason that a 100 ft.
piece of coax is equivalent to just over one wavelength at 10MHz. That is, the
10 MHz signal’s 85.57 ft. wavelength in coax is just shy of the 100 ft.
overall length of the piece of coax.

Consider the wavelength in feet for several frequencies in a vacuum and in our
100 ft. piece of coax, using the previous formulas. Because of the cable’s
velocity of propagation, each frequency’s wavelength in the cable will be a
little less than it is in a vacuum. The number of wavelengths can also be
figured out for each frequency in the 100 ft. piece of coax. Finally, knowing
that one wavelength (cycle) of a sine wave equals 360 degrees of phase, the
total number of degrees of phase the 100 ft. piece of cable represents at each
frequency can be calculated. All of this is summarized in the following table.

**_Table I-1 - Frequency, Wavelength, and Phase Relationships In 100 Feet Of Coax _**

![](PNMPFull.files/image238.png)

Next, plot the 100 ft. piece of cable’s phase-versus-frequency on a graph. In
the example in Figure I-2, the line is a sloped straight line-that is, phase
varies proportionally with frequency.

![](PNMPFull.files/image240.png)

**_Figure I-2 - Phase-Versus-Frequency For 100 Feet Of Coax _**

Finally, plot the time delay for each frequency through the 100 ft. piece of
cable. The line in Figure I-3 is the negative derivative of radian phase with
respect to radian frequency. It’s a flat straight line; because the delay is
the same at all frequencies, there is no group delay variation!

![](PNMPFull.files/image242.png)

**_Figure I-3 - Time Delay-Versus-Frequency For 100 Feet Of Coax _**

Another way of looking at this is to say that the cable’s velocity of
propagation is the same at all frequencies! In other words, every frequency
takes 116.86 ns to travel from one end of the 100 ft. piece of cable to the
other end. But what happens if something in the signal path causes some
frequencies to travel a little slower than other frequencies?

Look at the phase-versus-frequency trace (the sawtooth-shaped waveform) in
Figure I-4. Where phase does not vary proportionally with frequency-that is,
where the sloped line is not straight-group delay variation exists. The bottom
bathtub-shaped trace in the figure is group delay, plotted as frequency in the
horizontal axis versus time (100 ns/div) in the vertical axis. The group delay
trace reveals that a signal at 40 MHz takes about 300 ns longer to travel
through the network than a signal at 20 MHz.

![](PNMPFull.files/image244.png)

**_Figure I-4 - Complex Frequency Response In The Return Path _**

Common sources of group delay in a cable network include: AC power
coils/chokes (affects 5~10 MHz in the upstream)

Node and amplifier diplex filters (affect frequencies near the diplex filter
cutoff region in the upstream and downstream, typically the upper end of the
return spectrum, and the lower end of the downstream spectrum)

Band edges and rolloff areas High-pass filters, data-only filters, step
attenuators, feeder taps or in-line equalizers with filters Group delay ripple
caused by impedance mismatch-related micro-reflections and amplitude ripple

The Fix?

Use adaptive pre-equalization available in DOCSIS 1.1, 2.0, and 3.0 modems
(generally not supported in DOCSIS 1.0 modems)

If possible, avoid frequencies where diplex filter-related group delay is
common

Sweep the forward and reverse to ensure amplitude-versus-frequency response is
flat (set the sweep equipment to the highest resolution available, and use
resistive test points or probe seizure screws to see amplitude ripple)

Identify and repair impedance mismatches that cause micro-reflections

Use specialized test equipment to characterize and troubleshoot group delay
(group delay can exist even when amplitude-versus-frequency response is flat)

**I.5 Impedance Mismatch **

All transmission lines and their components have a property known as
characteristic impedance, expressed in ohms. Coaxial cable characteristic
impedance is related to the diameters of the center conductor and inside
surface of the shield, and the dielectric material’s dielectric constant.
Mathematically, that relationship is

![](PNMPFull.files/image246.png)

where:

Z0 = coaxial cable characteristic impedance D = inside diameter of shield d =
outside diameter of center conductor εr = dielectric constant

Consider 6-series coaxial cable, commonly used in cable subscriber drop
applications. A typical nominal impedance specification for 6-series
subscriber drop cable is 75 ohms ±3 ohms, with a nominal 85 percent velocity
of propagation. Assume the center conductor is 18 AWG (0.040 inch diameter),
and the inside diameter of the shield is 0.180 inch. The cable’s 85 percent
velocity of propagation translates to a dielectric constant of 1.3841 (see the
tutorial section on Velocity of Propagation). Using the previous formula, the
calculated impedance Z0 of the 6-series cable in this example is 76.6 ohms,
well within the specified 75 ohms ±3 ohms range.

Transmission line fundamentals typically are based upon a simplified model
that includes-as shown in

![](PNMPFull.files/image248.png)

Figure I-5-a signal source _S_, a lossless transmission line _T_, and a
terminating impedance comprising some sort of load or termination _L_. The
assumption is that all three components have the same characteristic impedance
_Z_, such that all power in the incident wave transmitted from the source is
absorbed by the load.

![](PNMPFull.files/image250.png)

**_Figure I-5 - Ideal Transmission Line Model _**

In the real world the signal source, transmission line, and load rarely have
the same impedance at all frequencies. As well, the transmission line has
attenuation which reduces the RF power of the signal(s) passing through it.
When the impedance of, say, the load _L _is different from that of the
transmission medium _T _(see Figure I-6), it is said that an impedance
mismatch exists. An impedance mismatch causes some or all the incident wave to
be reflected back toward the source10. The ratio of reflected to incident
voltages is known as the reflection coefficient Γ, described mathematically as
Γ = E-/E+, where E\- is the reflected wave’s voltage, and E\+ is the incident
wave’s voltage11.

![](PNMPFull.files/image252.png)

**_Figure I-6 - Real-World Transmission Line Model _**

The reflected wave interacts with the incident wave to produce standing waves,
also known as amplitude ripple. Impedance mismatches exist everywhere in our
cable networks. Indeed, while the nominal impedance of a coaxial cable network
and its components is said to be 75 ohms, every connector, amplifier, node,
splitter, coupler, power inserter, feeder tap, terminator, and even the cable
itself represent an impedance mismatch of some sort. The question is just how
severe are those impedance mismatches? There are several ways to characterize
the severity of an impedance mismatch. One is known as voltage standing wave
ratio (VSWR), defined as the ratio of the standing wave’s maximum voltage Emax
to its minimum voltage Emin along the transmission line:

VSWR = Emax/Emin

VSWR also is related to reflection coefficient Γ:

VSWR = (1+|Γ|)/(1-|Γ|)

Another way to characterize the severity of an impedance mismatch is return
loss (R), which is the ratio in decibels of incident power PI to reflected
power PR:

R = 10log10(PI/PR)

Consider a scenario in which the incident power is 20 watts, and an impedance
mismatch causes the reflected power to be 5 watts. The return loss is
10log10(20 watts/5 watts) = 6.02 dB. The relationship between VSWR and R is
given by VSWR = (10R/20 \+ 1)/(10R/20 - 1) and R(dB) =
20log10[(VSWR+1)/(VSWR-1)]. In this example, 6.02 dB return loss equals a VSWR
of 3.0:1. Note that return loss is always a positive number, since it is the
number of decibels between the amount of power in the incident and reflected
signals. Some references (and test equipment!) show return loss as a negative
number, but this is incorrect.

The worst case impedance mismatch is a short circuit, open circuit, or pure
reactance, all of which reflect 100% of the incident wave back toward the
source. In these three cases R = 0 dB. When a perfect impedance match exists-
that is, when ZT = ZL-all of the incident wave is absorbed by the load and R
is infinite (∞). While there are exceptions, most real-world impedance
mismatches cause return loss to be somewhere between 0 dB and ∞, since
impedance mismatches are rarely pure short or open circuits, and a truly
perfect impedance match with infinite return loss is more of a mathematical
construct. From a practical perspective, typical return loss values of
components in cable networks vary from a few dB to 30 dB or more.

When multiple impedance mismatches exist in a transmission medium-one example
might be two water- damaged feeder taps in the outside plant separated by a
span of feeder cable-multiple reflections occur! Figure I-7 shows an example
in which a +31 dBmV incident signal travels right to left from the upstream
output of the first water-damaged feeder tap (right side of figure) through a
100 ft. span of cable with 1 dB of loss. The first reflection occurs when the
now +30 dBmV incident signal reaches an impedance mismatch-the upstream input
of a second water-damaged feeder tap (left side of figure)-that has 7 dB
return loss. A +23 dBmV reflection is created (+30 dBmV incident signal - 7 dB
return loss = +23 dBmV reflection), which travels back toward the first feeder
tap that also has 7 dB return loss. The now +22 dBmV reflection is re-
reflected at a level of +15 dBmV at the first feeder tap (+22 dBmV reflection
- 7 dB return loss = +15 dBmV second reflection), which travels back toward
the second feeder tap and arrives there at +14 dBmV. And so on.

![](PNMPFull.files/image254.png)

**_Figure I-7 - Creation of Reflections in a Cable Network's Feeder Plant _**

The scenario in Figure I-7 can be represented graphically as shown in Figure
I-8.

![](PNMPFull.files/image256.png)

**_Figure I-8 - Graphic Representation of Incident Signal and Second Reflection _**

The tall vertical line marked +30 dBmV represents the incident signal at the
upstream input to the feeder tap on the left side of Figure I-7. The second,
somewhat shorter vertical line marked +14 dBmV represents

the second reflection, also at the input to the first feeder tap on the left
side of Figure I-7. The horizontal separation between the two vertical lines
represents the time delay between the +30 dBmV incident signal and the +14
dBmV reflection. Assuming the 100 ft. span of cable has a velocity of
propagation of 87%, RF travels through each foot of coax in about 1.17
nanosecond. Since the roundtrip distance for the reflection is 100 ft. + 100
ft. = 200 ft., the second reflection’s time delay is 200 ft. x 1.17 nanosecond
= 234 nanoseconds.

**I.5.1 Reflection or Micro-reflection? **

When an impedance mismatch causes some or all of the incident wave to be
reflected back toward the source, the reflected wave is called simply a
reflection or an echo. In the world of high-speed data communications over
cable networks, the term micro-reflection is frequently used. A micro-
reflection is still a reflection or echo. “Micro-reflection” generally denotes
a reflection with a short time delay-that is, a close-in reflection whose time
delay relative to the incident signal ranges from less than a symbol period to
perhaps several symbol periods.

As noted earlier in this tutorial, reflections (and micro-reflections) are
caused by impedance mismatches. Some of the more typical causes of impedance
mismatches and the resulting micro-reflections in cable networks include:  

Damaged or missing end-of-line terminators

Damaged or missing chassis terminators on directional coupler, splitter, or
multiple-output amplifier unused ports

Loose center conductor seizure screws

Unused feeder tap ports not terminated; this is especially critical on low
value feeder taps, but all unused feeder tap ports should be terminated with
75-ohm terminations (locking terminators without resistors or stingers do not
terminate the feeder tap port)

Poor isolation in splitters, feeder taps, and directional couplers Unused
customer premises splitter and directional coupler ports not terminated

Use of so-called self-terminating feeder taps at ends-of-line; these are the
equivalent of splitters, and do not properly terminate the feeder cable unless
all feeder tap ports are terminated

Kinked or damaged cable (includes cracked cable, which causes a reflection and
ingress)

Defective or damaged actives or passives (water-damaged, water-filled, cold
solder joint, corrosion, loose circuit board screws, etc.)

Cable-ready TVs and VCRs connected directly to the drop (return loss on most
cable-ready devices is poor)

Some traps and filters have been found to have poor return loss in the
upstream, especially those used for data-only service

**I.6 Amplitude Ripple **

As noted in the Impedance Mismatch tutorial section, a reflected wave
interacts with an incident wave to produce standing waves (amplitude ripple).
The double reflection example from the same tutorial section is shown in
Figure I-9, and will be used to illustrate how amplitude ripple forms.

 ![](PNMPFull.files/image258.png)

**_Figure I-9 - Reflection Example that will be Used to Illustrate the Formation of Amplitude Ripple _**

First, convert the incident and reflected signals from dBmV to millivolts (mV)
using the formula mV = 10 (dBmV/20). This results in +30 dBmV = 31.62 mV and
+14 dBmV = 5.01 mV. Next look at phasor views of the incident and reflected
signals, with each represented as a vector12. The length of each vector
corresponds to the signal magnitude in millivolts, and the direction vectors
point is phase. In this example make the incident signal’s vector (long arrow)
stationary while the reflection’s vector (short arrow) rotates
counterclockwise around the end of the incident signal’s vector. The vector
sum of the two vectors will be plotted on a graph from which the amplitude
ripple is derived. In Figure I-10 the incident and reflected signals are in
phase, represented by the two arrows placed end-to-end in series. The vector
sum in this case is simply 31.62 mV + 5.01 mV = 36.63 mV.

![](PNMPFull.files/image260.png)

**_Figure I-10 - Phasor View of Incident Signal Vector (Long Arrow) and Reflection Vector (Short Arrow) _**

Figure I-11 shows the reflection’s vector rotated counterclockwise 45 degrees
from its original position. In reality the reflection vector rotates
continuously around the end of the incident signal vector; it does not move in
increments of 45 degrees. The latter is for illustrative purposes. The vector
sum of the incident and reflection vectors is 35.34 mV (fine dashed arrow),
which is calculated using basic geometry.

![](PNMPFull.files/image262.png)

**_Figure I-11 - Reflection Vector Rotated 45 Degrees From Original Position _**

The Figure I-12 shows the reflection vector has rotated counterclockwise 90
degrees from its original position. The vector sum of the incident and
reflection vectors is 32.01 mV (fine dashed arrow).

![](PNMPFull.files/image264.png)

**_Figure I-12 - Reflection Vector Rotated 90 Degrees From Original Position _**

Figure I-13 shows the reflection vector rotated counterclockwise 135 degrees
from its original position. The vector sum of the incident and reflection
vectors is 28.3 mV (fine dashed arrow).

![](PNMPFull.files/image266.png)

**_Figure I-13 - Reflection Vector Rotated 135 Degrees From Original Position _**

Figure I-14 shows the reflection vector rotated counter clockwise 180 degrees
from its original position. Since the incident and reflection vectors are out
of phase, the vector sum is 31.62 mV - 5.01 mV = 26.61 mV.

![](PNMPFull.files/image268.png)

**_Figure I-14 - Reflection Vector Rotated 180 Degrees From Original Position _**

The following figures show the reflection vector’s phase in 45 degree
increments, until it reaches 360 degrees (0 degrees), from which the
counterclockwise rotation continues.

![](PNMPFull.files/image270.png)

**_Figure I-15 - Reflection Vector Rotated 225 Degrees From Original Position _**

![](PNMPFull.files/image272.png)

**_Figure I-16 - Reflection Vector Rotated 270 Degrees From Original Position _**

![](PNMPFull.files/image274.png)

**_Figure I-17 - Reflection vector rotated 315 degrees from original position _**

![](PNMPFull.files/image276.png)

**_Figure I-18 - Reflection Vector Back At Original Position After Rotating 360 Degrees _**

The next step is to plot the vector sum vectors-the fine-dashed arrows-on a
graph of amplitude-versus- phase (time), as shown in Figure I-19. Note that
“connecting the dots” along the tops of the plotted vector sum vectors traces
out the amplitude ripple caused by the reflection!

![](PNMPFull.files/image278.png)

**_Figure I-19 - Amplitude-Versus-Phase Plot Of Phasor View Vector Sum Vectors _**

Now that the magnitude of the amplitude ripple has been plotted, other details
of interest can be derived from the response. The peak-to-valley amplitude
ripple in decibels is 20log10(EP/EN)-where EP is the ripple’s peak voltage and
EN is the ripple’s null voltage-or, for the example in Figure I-19,
20log10(36.63 mV/26.61 mV) = 2.78 dB. By already knowing the incident signal
amplitude is +30 dBmV and the reflection’s amplitude is +14 dBmV (16 dB
difference), the relative amplitude difference between the incident and
reflection signals from the amplitude ripple plot can be validated. That is
done using the formula 20log10[(EP-EN)/(EP+EN)], or
20log10[(36.63-26.61)/(36.63+26.61)] = -16 dBc.

The frequency of the amplitude ripple example being discussed here is the
reciprocal of the reflection’s 234 ns time delay: 1/0.000000234 second =
4,273,504 Hz or 4.27 MHz. This is equal to the frequency spacing between
adjacent ripple peaks or nulls. The distance between the two impedance
mismatches in feet is 492*(V/FMHz), where V is the coaxial cable’s velocity
factor (velocity of propagation expressed in decimal form rather than
percentage), and FMHz is the frequency spacing in MHz between adjacent peaks
or nulls. Assuming 0.87 velocity factor (87% velocity of propagation) and
approximately 4.27 MHz frequency spacing between adjacent peaks or nulls, the
distance is 492*(0.87/4.27) ≈ 100 feet.

**I.7 Amplitude Tilt **

One manifestation of nonflat amplitude-versus-frequency response is amplitude
tilt. That is, the amplitude-versus-frequency characteristic of the channel or
operating spectrum is sloped or tilted across a specified frequency range.
Figure I-20 illustrates flat amplitude-versus-frequency response, in which
each frequency has the same amplitude-indicated by the horizontal dashed line.

![](PNMPFull.files/image280.png)

**_Figure I-20 - Example Of Flat Amplitude-Versus-Frequency Response _**

Figure I-21 shows amplitude tilt, indicated by the sloping dashed line.

![](PNMPFull.files/image282.png)

**_Figure I-21 - Example of tilted or sloped amplitude-versus-frequency response _**

Figure I-22 and Figure I-23 show two upstream 6.4 MHz 64-QAM signals, one with
significant in-channel tilt and one that is mostly flat.

![](PNMPFull.files/image284.png)

**_Figure I-22 - Example Of Upstream 64-QAM Signal With Substantial In-Channel Tilt _**

![](PNMPFull.files/image286.png)

**_Figure I-23 - Example Of 64-QAM Signal After Adaptive Pre-Equalization Eliminated Most of the In-channel Tilt _**

Among the causes of amplitude tilt are defective active or passive devices, as
well as active device misalignment. Note that many cable network distribution
actives are often set up with an intentionally sloped output in part to
compensate for the attenuation-versus-frequency characteristic of coaxial
cable following the active device.

Other causes of amplitude tilt include operation near band edges or rolloff
areas of the spectrum (or a filter), where amplitude-versus-frequency may not
be flat. As well, short time delay reflections will result in widely spaced
amplitude ripple, which may tilt the amplitude-versus-frequency response of
signals in the sloped portion of the ripple. Figure I-24 shows an example of
the latter scenario, where amplitude tilt is present between the two vertical
dashed lines.

![](PNMPFull.files/image288.png)

**_Figure I-24 - A Signal Carried in the Sloped Portion of the Widely Spaced Amplitude Ripple Will Exhibit In- channel Tilt _**

**I.8 Modulation Error Ratio **

Modulation error ratio (MER) is a parameter reported by most QAM (quadrature
amplitude modulation) analyzers when measuring the performance of digitally
modulated signals. QAM analyzer screen shots showing a 64-QAM signal with good
(36.3 dB) and poor (23.2 dB) MER can be seen in Figure I-25 and Figure I-26.
Digital set-tops and cable modems report signal-to-noise ratio (SNR)-actually
MER-for the downstream QAM signal to which the device is tuned, and cable
modem termination systems (CMTSs) report upstream SNR (MER). But what is MER?

![](PNMPFull.files/image290.png)

**_Figure I-25 - 64-QAM Signal With Good (36.3 dB) MER _**

![](PNMPFull.files/image292.png)

**_Figure I-26 - 64-QAM Signal With Poor (23.2 dB) MER _**

One analogy that might help to clarify the concept of MER is target shooting.
A typical target used at the range comprises a set of concentric circles
printed on a piece of paper. The center of the target is called the
bull’s-eye, which carries the highest point value. The further away from the
bull’s-eye, the lower the assigned points. Ideally, one would always hit the
bull’s-eye and get the maximum possible score. In the real world, this seldom
happens. Instead, one or two shots might hit at or near the bull’s-eye, and
most of the rest hit somewhere in the circles surrounding the center of the
target. For a person who is a decent shot, a round of target shooting usually
results in a fairly uniform “fuzzy cloud” of holes in and around the
bull’s-eye. The smaller the diameter of this cloud and the closer it is to the
bull’s-eye, the higher the score.

A variety of factors affects how close to the bull’s-eye the shots land. Some
of those factors include the quality and accuracy of the firearm, type of
ammunition used, weather conditions if outdoors, ambient lighting, distance to
the target, steadiness of aim, breathing control, and so on.

Now visualize the constellation display on a QAM analyzer (refer to Figure
I-25 and Figure I-26). Each symbol landing on the constellation can be thought
of as a target of sorts. For instance, a 64-QAM constellation has 64 targets
arranged in an eight-by-eight square-shaped grid. Ideally, when the 64 symbols
are transmitted, they should land exactly on their respective targets’
“bull’s-eyes” in the constellation display. In reality, the symbols form a
fuzzy cloud at and around the constellation’s target centers. Measuring MER
is, in effect, measuring the fuzziness of those clouds. The smaller the fuzzy
clouds, the higher the MER. Like a high score in target shooting, the higher
the MER, the better.

Modulation error ratio is digital complex baseband SNR-in fact, in the data
world, the terms “SNR” and “MER” are often used interchangeably, adding to the
confusion that sometimes exists about SNR, especially considering that in the
telecommunications world, the terms “carrier-to-noise ratio (CNR)” and “SNR”
are often used interchangeably.

Why use MER to characterize a data signal? Modulation error ratio is a direct
measure of modulation quality and has linkage to bit error rate. Modulation
error ratio is normally expressed in decibels, so it is a measurement that is
familiar to cable engineers and technicians. It’s a useful metric with which
to gauge the end-to-end health of a network, although by itself, MER provides
little or no insight about the type of impairments that exist.

Figure 27 illustrates a 16-QAM constellation. A perfect, unimpaired 16-QAM
digitally modulated signal would have all of its symbols land at exactly the
same 16 points on the constellation over time. Real-world impairments cause
most of the symbol landing points to be spread out somewhat from the ideal
symbol landing points. If a constellation diagram is used to plot the landing
points of a given symbol over time, as previously mentioned the resulting
display forms a small “cloud” of symbol landing points rather than a single
point.

Figure 27 shows the vector for a target symbol - the ideal symbol to be
transmitted. Because of one or more impairments, the transmitted symbol vector
(or received symbol vector) is a little different than ideal. Modulation error
is the vector difference between the ideal target symbol vector and the
transmitted symbol vector. That is,

![](PNMPFull.files/image294.png)

**_Figure I-27 - 16-QAM Constellation Showing Target Symbol, Transmitted (or Received ) Symbol, and Modulation Error Vectors _**

Modulation error ratio is the ratio, in decibels, of average symbol power to
average error power: MER(dB) = 10log(average symbol power/average error
power). From this, you can see that the fuzzier the symbol cloud-in other
words, the greater the average error power-the lower the MER. See Figure I-28.

![](PNMPFull.files/image296.png)

**_Figure I-28 - MER is the Ratio of Average Symbol Power to Average Error Power _**

Mathematically, a more precise definition of MER is:

![](PNMPFull.files/image298.png)

where _I _and _Q _are the real (in-phase) and imaginary (quadrature) parts of
each sampled ideal target symbol vector, and _δI _and _δQ _are the real (in-
phase) and imaginary (quadrature) parts of each modulation error vector. This
definition assumes that a long enough sample is taken so that all the
constellation symbols are equally likely to occur. Refer to the RxMER
Measurement in Appendix I.9 tutorial section for more information on how MER
is computed.

MER is affected by pretty much everything in a digitally modulated signal’s
transmission path: transmitted phase noise; carrier-to-noise ratio; nonlinear
distortions (composite triple beat, composite second order, cross modulation,
common path distortion); linear distortions (micro-reflections, amplitude
tilt/ripple, group delay); in-channel ingress; laser clipping; data
collisions; and even suboptimal modulation profiles. Some of these can be
controlled fairly well, but no matter what is done, a digitally modulated
signal is going to be impaired as it makes its way through a cable network.
The worse the impairments, the fuzzier the constellation landings. The fuzzier
the constellation landings, the lower the MER.

As such, the constellation’s symbol landings will never be perfectly small
points. They will always be spread out at least a little, the extent of which
is described by MER. By itself, a low measured MER value doesn’t determine
what caused it to be low in the first place, only that it is low. Poor
carrier-to-noise ratio? In-channel ingress? Group delay? Micro-reflection?
Hard to say, until additional diagnostics are done with test equipment such as
a QAM analyzer.

**I.9 RxMER Measurement in a Digital Receiver **13 

This tutorial discusses how a digital receiver is implemented, and how RxMER
is measured. Figure I-29 is a generalized block diagram of a digital QAM
receiver. The receiver may reside in the CMTS, in which case it receives time-
division multiple access (TDMA) or synchronous code division multiple access
(S-CDMA) upstream bursts; or it may reside in a cable modem or set-top box
(STB), in which case it receives a continuous stream of downstream digital
data. The RF signal from the cable plant enters at the left of the diagram,
and is processed by analog and digital front-end components that perform
tuning, automatic gain control, channel selection, analog-to-digital
conversion, and related functions. The square-root Nyquist filter has a
response “matched” to the symbol or S-CDMA chip (a “chip” is a bit in the
pseudorandom spreading code used in S-CDMA). An adaptive equalizer compensates
for channel response effects, including group delay variation, amplitude tilt
or ripple, and micro-reflections. An ingress canceller is normally included in
a CMTS burst receiver to remove in-channel narrowband interference.
Acquisition and tracking loops provide estimates of frequency, phase, and
symbol timing, allowing the receiver to lock to the incoming signal. In the
CMTS burst receiver, preamble symbols are used as a reference to aid in the
acquisition and tracking of each upstream burst. In the case of S-CDMA, the
chips are despread. The received QAM symbol, or “soft decision,” is passed to
the slicer, which selects the nearest ideal symbol or “hard decision,” from
the QAM constellation. The decisions are passed to the Trellis decoder,
descrambler, deinterleaver, Reed-Solomon (RS) FEC decoder and MPEG deframer,
and on to the MAC layer, which assembles and outputs received packets to the
user.

![](PNMPFull.files/image300.png)

**_Figure I-29 - QAM Receiver Block Diagram _**

What Is Inside the Blocks in a Digital QAM Receiver?

_Analog and digital front end: _Analog and digital front-end components
perform tuning, automatic gain control, channel selection, analog-to-digital
conversion, and related functions. Their purpose is to preprocess the signal
so that the individual QAM RF channels are available for further digital
processing.

_Matched filter: _The square-root Nyquist filter has a response matched to the
symbol or S-CDMA chip. An identical filter is located in the transmitter; this
“matched-filter” arrangement gives optimal receive SNR in white noise. The
cascade of the transmit and receive square-root filters gives a response with
the “Nyquist property.” This property, expressed in the time domain, results
in ideally zero ISI, even when symbols are transmitted so close together in
time that their responses significantly overlap.

_Adaptive equalizer: _This element compensates for channel effects, including
group delay variation, amplitude slope or tilt, and micro-reflections. It
adapts its filter coefficients to dynamically varying channel responses so as
to maximize the receive MER. In effect, an adaptive equalizer creates a
digital filter with the opposite response of the impaired channel.

_Ingress canceller: _An ingress canceller is normally included in a CMTS burst
receiver to remove narrowband interference (including CB, ham and shortwave
radio signals, etc.). It operates by dynamically detecting and measuring the
interference, and adapting its coefficients to cancel it.

_Acquisition and tracking loops: _Tracking loops provide estimates of
frequency, phase, and symbol timing, allowing the receiver to lock to the
incoming signal. Acquisition refers to the initialization and pull-in process
that occurs when the receiver is first powered on or changes channels.

_Despreader: _(S-CDMA upstream only) Despreading consists of multiplying the
composite received signal by a given code sequence, and summing over all 128
chips in the code. There are 128 despreaders, one for each code. The output of
the despreader is a soft symbol decision.

_Slicer: _The slicer selects the nearest ideal symbol, known as a hard
decision, from the QAM constellation. _Trellis decoder: _(Downstream and some
S-CDMA upstream modes) The trellis decoder uses the Viterbi

algorithm to choose the most likely sequence of symbols and thereby reject
noise.

_Descrambler: _The descrambler adds a pseudorandom bit sequence to the
received data bits, reversing the scrambling operation performed at the
transmitter. The purpose of scrambling is to randomize the transmitted data in
order to provide an even distribution of QAM symbols across the constellation.

_Deinterleaver: _The deinterleaver pseudo-randomly reorders groups of received
bits, reversing the interleaving operation performed at the transmitter. The
purpose of deinterleaving is to break up long bursts of noise so that the
errored bits can be corrected by the Reed-Solomon decoder.

_Reed-Solomon _(RS) FEC decoder: This device processes groups of bits (7- or
8-bit symbols) arranged in codeword blocks, in terms of an algebraic code
using Galois field arithmetic. By processing the received code words, which
include redundant parity symbols, receive symbol errors can be found and
corrected, up to one corrected RS symbol for each two redundant RS parity
symbols.

_MPEG deframer_: The downstream DOCSIS signal is grouped into 188-byte MPEG
transport packets, permitting the multiplexing of video and data over the
common physical layer. The MPEG deframer removes the MPEG transport overhead
to recover the bytes that are delivered to the MAC layer.

_MAC: _The media access control (MAC) layer controls the physical (PHY) layer
and is the source and sink of PHY data. The MAC layer processes data frames
delineated by DOCSIS headers. In the upstream, the MAC layer governs how cable
modems share the channel through a request or grant mechanism.

The input and output of the slicer are complex numbers or vectors, each
represented by two components: magnitude and phase, or equivalently, real (in-
phase or “I”) and imaginary (quadrature or “Q”) parts, as shown in Figure
I-30. In an ideal zero-noise, zero-ISI condition, the soft decision would lie
exactly on one of the constellation points, and the magnitude of the error
between them would be zero. In a real-world receiver, subtracting the hard-
decision vector from the soft-decision vector gives the error or noise vector
at each symbol time. The implicit assumption is that a low symbol error rate
exists - that is, very few decisions are incorrect, ensuring that the
“decision-directed” error vector from the nearest symbol nearly always equals
the true error vector from the correct reference symbol.

![](PNMPFull.files/image302.png)

**_Figure I-30 - Each Vector Has a Real (In-Phase or I) and Imaginary (Quadrature or Q) Component _**

For RxMER, the concern is with the average power of the error vector, which is
computed by taking the complex magnitude-squared of the error vector and
accumulating or averaging it over a given number of symbols _N_. This process
gives the error vector power (or noise power) at the slicer. To obtain the
ratio of signal to noise, the average signal power (a known constant for each
constellation, such as 64-QAM or 256-QAM) is divided by the average error
vector power. Then take the logarithm to convert to decibels, giving RxMER in
dB. To summarize: RxMER is simply the ratio of average symbol power to average
slicer error power, expressed in dB.

**I.10 Adaptive Equalization **

Digital communications systems are designed to transmit high-speed data
through band-limited channels- for example, 6 MHz bandwidth downstream
channels or 3.2 MHz bandwidth upstream channels. In the vast majority of cases
a digitally modulated signal must be transmitted through a channel that is
susceptible to various distortions. The presence of distortion in the channel
results in something called inter-symbol interference (ISI), which may cause
data transmission errors. One way to compensate for or reduce ISI is to
incorporate an equalizer in the receiver or transmitter. If the channel
characteristics are known and do not change over time, fixed-value equalizers
are one possible solution. However, in a typical cable network the signal path
between the headend and each cable modem (or digital set-top) is unique, so a
one-size-fits-all fixed-value equalizer is impractical. Furthermore,
distortions causing ISI often change over time, so the equalizer must somehow
be adjustable to compensate for changes in channel conditions. Adaptive
equalizers are most often used for this purpose.

All QAM receivers-whether in a digital set-top, cable modem, QAM analyzer, or
even the upstream receiver of a cable modem termination system
(CMTS)-incorporate a circuit known as an adaptive equalizer. Adaptive
equalization is used in data transmission to compensate for certain in-channel
impairments that degrade the quality of digital signals. Most discussions
about adaptive equalization are full of complex mathematics and difficult-to-
understand concepts. This tutorial provides a high-level overview of what
adaptive equalization is and how it works, without the gnarly equations and
Ph.D.-level techno-speak. Included is a step-by-step example of how a simple
four-tap adaptive equalizer can be used to reduce in-channel impairments
caused by a severe micro-reflection.

Consider first the concept of equalization from the perspective of a cable TV
distribution network. It is understood that in a given length of coaxial cable
higher frequencies are attenuated more than lower frequencies. For instance,
if all downstream signals in the 54-870 MHz spectrum have the same amplitude
at the output of an amplifier, the overall frequency response-technically
speaking, amplitude (or magnitude)-versus-frequency response-is flat. For the
following example, assume there is no slope at an amplifier’s output (and the
amplifier has no internal slope or tilt), and our equal-amplitude signals
leave the output of the first amplifier and travel through 1,000 feet of 0.500
inch diameter coax to the second amplifier.

Since 0.500 inch diameter distribution cable’s attenuation is about 0.5 dB/100
ft. at 54 MHz and 2.3 dB/100 ft. at 870 MHz, our hypothetical 1,000 ft. span
of coax has a total of 5 dB of attenuation at 54 MHz and 23 dB of attenuation
at 870 MHz. The 54-870 MHz spectrum will be tilted a bunch at the second
amplifier’s input! The goal is to see a flat amplitude-versus-frequency
response across the spectrum, so it is necessary to install a fixed-value
plug-in equalizer at the second amplifier. The equalizer is a small passive
circuit that has the opposite amplitude-versus-frequency response of the 1,000
feet of coaxial cable preceding the amplifier. The equalizer is in effect a
broadband filter that “cancels” the tilted response from 54 to 870 MHz,
resulting in a flat amplitude-versus-frequency spectrum at the second
amplifier’s internal gain stages.

Adaptive equalization performs a function similar to that of a cable
amplifier’s fixed-value plug-in equalizer. Rather than equalizing the entire
54-870 MHz downstream or 5-42 MHz upstream RF spectrum, it deals with just a
single channel. Adaptive means the equalizer can change its characteristics as
channel conditions change.

An adaptive equalizer is a digital circuit that compensates for a digitally
modulated signal’s in-channel complex frequency response impairments. The
cable industry has long used the term frequency response to describe amplitude
(or magnitude)-versus-frequency-that is, what is seen on the display of test
equipment used to sweep outside plant. True frequency response is a complex
entity that has two components: amplitude-versus-frequency, and phase-versus-
frequency. An adaptive equalizer can compensate for in-channel amplitude- and
phase-versus-frequency impairments.

The adaptive equalizer uses sophisticated algorithms to derive coefficients
for an equalizer solution “on the fly”-in effect, creating a digital filter
with essentially the opposite complex frequency response of the impaired
channel. Because the adaptive equalizer’s complex frequency response is in
theory a mirror image of the impaired channel’s complex frequency response,
the adaptive equalizer cancels out most or all of the degraded in-channel
frequency response that is affecting the digital signal-within the limits of
the adaptive equalizer’s capabilities, of course.

It’s important to note that at high signal-to-noise ratio (ES/N0), the
adaptive equalizer will synthesize the opposite response of the channel. At
lower SNR doing so would cause noise enhancement, so a compromise solution is
derived.

Ideal adaptive equalizer coefficients yield maximum modulation error ratio
(MER) by minimizing total impairments including inter-symbol interference
(ISI), within the limits of the equalizer’s capabilities (number of adaptive
equalizer taps, etc.).

If the in-channel impairment suddenly changes or goes away, the adaptive
equalizer will distort the signal, at least until new equalizer coefficients
for the current channel conditions are derived and the equalizer’s operation
updated. This adaptation process is very fast, typically completed in
milliseconds.

![](PNMPFull.files/image304.png)

**_Figure I-31 - Unequalized 64-QAM Constellation _**

![](PNMPFull.files/image306.png)

**_Figure I-32 - Equalized 64-QAM Constellation _**

The test equipment screen shot in Figure I-31 shows an unequalized 64-QAM
constellation. Note that the constellation’s 64 symbol landings are “fuzzy,”
caused by degraded modulation error ratio. Indeed, the unequalized MER is
about 25 dB, only a few dB above the lower ES/N0 threshold for 64-QAM.14

The screen shot in Figure I-32 shows the same 64-QAM signal after adaptive
equalization. The 64 symbol landings are small and almost dot-like. The
equalized MER is >40 dB. The adaptive equalizer has effectively compensated
for in-channel response impairments, but the equalized MER and constellation
do not provide a way to determine how close to the failure threshold the
signal really is.

By evaluating both unequalized and equalized MER, one can determine available
MER headroom, and also see how well adaptive equalization is able to improve
the signal.

In order for an adaptive equalizer’s algorithms to begin the process of
deriving coefficients that will be used to create a “filter” whose complex
frequency response is opposite of the channel’s complex frequency response,
the equalizer starts with an adaptation source. The adaptation source can be a
transmitted training sequence, or the signal itself.

**Transmitted training sequence**: In conventional zero-forcing or minimum mean square error (MSE) equalizers, a known training sequence is transmitted to the receiver for the purpose of initially adjusting adaptive equalizer coefficients. In the DOCSIS upstream pre-equalization process (discussed in the Adaptive Pre-equalization tutorial section), data transmissions from all cable modems include a preamble at the beginning of each burst. The preamble is used as a training signal for the cable modem termination system’s (CMTS’s) adaptive equalizer. 

**The signal itself**: Adaptive equalizers that do not rely upon transmitted training sequences for the initial adjustment of the coefficients are called self-recovering or blind adaptive equalizers. The adaptive equalizer in the downstream receiver of a DOCSIS cable modem (or a digital set-top) is a blind adaptive equalizer. In the case of cable modems, DOCSIS does not specify a training sequence in the downstream signal. 

Several types of adaptive equalization methods are used in data transmission.
For example, one method is based on maximum-likelihood (ML) sequence
detection; another uses a linear filter with adjustable coefficients.
Decision-feedback equalization-comprising a combination of feedforward and
feedback filters-uses previously detected symbols to suppress inter-symbol
interference in the current symbol being detected. A commonly used adaptive
equalization type is a combination of decision-feedback and feedforward
equalizers.

Powerful algorithms are used to automatically adjust adaptive equalizer
coefficients to achieve optimum performance, and to rapidly adapt to changing
channel characteristics. General criteria for defining optimum performance
include minimizing peak distortion at the equalizer output, or minimizing the
MSE at the equalizer output. In other words, the algorithm adjusts equalizer
coefficients “on the fly” to converge on a solution that best reduces, say,
MSE.

Zero-forcing and least-mean-square (LMS) are among the algorithms used in
adaptive equalizers. Fractionally spaced equalizers (FSE) may use a LMS
algorithm or a tap-leakage algorithm.

If faster convergence is desired in an equalizer, more complex algorithms
generally have to be used. Examples include a recursive least-squares (Kalman)
algorithm. Blind equalizers may use stochastic gradient algorithms such as
Godard, Sato, Benveniste-Goursat, or stop-and-go.

_Digital Communications, 4__th __Edition_, by John G. Proakis (McGraw-Hill,
2001, ISBN 0-07-232111-3), includes in-depth explanations of the adaptive
equalizer and algorithm types mentioned here.

An important parameter in an adaptive equalizer is its span, defined
mathematically as **(number of equalizer taps - 1) x equalizer tap spacing**.
This particular definition assumes that the equalizer’s first tap is the main
tap. Adaptive equalizer tap spacing is the amount of time delay per equalizer
tap. An adaptive equalizer’s span is directly related to the maximum amount of
time delay in a micro-reflection that can be compensated for.

The adaptive equalizer tap spacing of a DOCSIS 2.0 cable modem’s upstream pre-
equalizer taps is called T- spaced, or symbol-spaced. Symbol-spaced means the
time delay per adaptive equalizer tap is equal to the symbol period, which is
the reciprocal of the symbol rate-that is, 1/T. For example, if the upstream
digitally modulated signal’s symbol rate is 5.12 megasymbols per second
(Msym/sec), the adaptive equalizer tap spacing is 0.1953125 microsecond (μs)
per tap: 1/5,120,000 = 1.953125 x 10-7 second, or 0.1953125 μs.

Since DOCSIS 2.0 specifies 24-tap T-spaced pre-equalization in the upstream,
the maximum span of an adaptive equalizer for a 5.12 Msym/sec signal is (24 -
1) x 0.1953125 μs = 4.49 μs. Another way to calculate this value is (24 -
1)/5.12 = 4.49 μs.

Currently available CMTS burst receivers, which incorporate DOCSIS 2.0 and
later 24-tap adaptive equalization, support main tap positions of 2 through
10. Adaptive equalizer tap position 8 generally is the default setting. How
does that affect the maximum usable equalizer span when it comes to dealing
with micro-reflections? Assuming that adaptive equalizer tap #8 is the main
tap, that results in a usable span of (24 - 8) x 0.1953125 μs = 3.13 μs. If
the adaptive equalizer main tap is changed to #10, the usable span becomes
(24-10) x 0.1953125 = 2.73 μs, and if the adaptive equalizer main tap is
changed to #2 the usable span becomes (24-2) x 0.1953125 = 4.3 μs.

T-spaced equalizers are the most commonly used. As discussed previously,
T-spaced means the equalizer taps are spaced at the reciprocal of the symbol
rate.

A _fractionally spaced equalizer _is based on sampling the incoming signal at
least as fast as the _Nyquist rate_. (From Wikipedia: “The Nyquist rate is the
minimum sampling rate required to avoid aliasing when sampling a continuous
signal. In other words, the Nyquist rate is the minimum sampling rate required
to allow unambiguous reconstruction of a band limited continuous signal from
its samples. If the input signal is real and band limited, the Nyquist rate is
simply twice the highest frequency contained within the signal.”)

A 1⁄2T-spaced (also written as “T/2-spaced”) equalizer is used in many
applications requiring a FSE. Other applications may use 1⁄4T-spaced
(T/4-spaced) equalizers, and so forth.

Why use a FSE? They often perform better than T-spaced equalizers in the
presence of symbol clock timing errors, because FSEs are less sensitive to
timing phase. Despite their better performance, FSEs are not as common as
T-spaced equalizers because of computational complexity and convergence
performance.

DOCSIS supports T-spaced and fractionally spaced equalizers under the
following conditions for upstream pre-equalization, defined in the DOCSIS 2.0
Radio Frequency Interface Specification: “_There are two modes of operation
for the pre-equalizer of a CM: DOCISIS 1.1 mode, and DOCSIS 2.0 mode. In
DOCSIS 1.1 mode, the CM MUST support a (T)-spaced equalizer structure with 8
taps; the pre-equalizer MAY have 1, 2 or 4 samples per symbol, with a tap
length longer than 8 symbols. In DOCSIS 1.1 mode, for backwards compatibility,
the CMTS MAY support fractionally spaced equalizer format (T/2 and T/4). In
DOCSIS 2.0 mode, the pre-equalizer MUST support a symbol (T)-spaced equalizer
structure with 24 taps.” _

If the channel response contains a reflection (caused by an impedance
mismatch) that is further out in delay than the span of the adaptive
equalizer, the adaptive equalizer cannot compensate for that reflection.

For example, if there is a significant amount of ISI from a SAW filter’s
triple transit, and this ISI is equivalent to a reflection at a large delay
that is beyond the span of the equalizer’s taps, then the equalizer will still
do its best on the other impairments. But it won’t be able to cancel the
triple transit reflections since they are beyond the limits of the adaptive
equalizer’s capabilities-in this case, the equalizer span.

![](PNMPFull.files/image308.png)

Figure I-33 illustrates a generic adaptive equalizer. The top row with boxes
labeled Z-1 can be thought of as a tapped delay line. Each box marked Z-1 is a
_delay element_, with the amount of time delay per “box” equal to the
reciprocal of the symbol rate in a T-spaced equalizer. A delay element is
often called a tap, but an adaptive equalizer tap also can be considered the
combination of a delay element, the point where some of the signal is “tapped”
off, and a multiplier. The boxes labeled b-2, b-1, b0, etc., are multipliers
with coefficients that set the gain for each adaptive equalizer tap. The
algorithm adjusts the equalization coefficients that set the gain for each
multiplier. The circles marked Σ are summing or combining circuits.

One adaptive equalizer tap is called the main tap (the second Z-1 delay
element to multiplier b0 and highlighted in red in the figure). The main tap
has a gain of 1, and passes the input signal at its original amplitude. Other
adaptive equalizer taps represent either the “past” or “future” relative to
the main tap, and vary the amplitudes of the respective signals passing
through them as required.

While an adaptive equalizer is a digital circuit, one can think of its
operation as functionally similar to an analog circuit that combines different
amplitudes and phases of an input waveform to achieve a desired output
waveform.

To better understand how a simple adaptive equalizer works, consider a
scenario in which an impedance mismatch results in a severe micro-reflection.
Assume that the incident signal has an amplitude of 1, and the echo (micro-
reflection) caused by the impedance mismatch has an amplitude of -0.5 and is
offset in time by 1 μs. The minus sign indicates that the echo has the
opposite phase of the incident signal. Figure I- 34 illustrates the incident
signal and echo graphically in terms of amplitude-versus-time.

![](PNMPFull.files/image310.png)

**_Figure I-34 - Amplitude-versus-time Plot of an Incident Signal and Micro-reflection _**

Figure I-35 shows amplitude (or magnitude)-versus-frequency response caused by
the 1 μs micro- reflection from Figure I-34. When the incident and micro-
reflection vectors are in phase, they add to create a vector whose sum is 1.5;
when the two vectors are out of phase, the resulting vector sum is 0.5. This
makes the scalloped sine wave’s peak-to-peak amplitude vary from 0.5 to 1.5,
which, in decibels, is 20log(1.5/0.5) = 9.54 dB. The frequency spacing between
successive peaks is 1/1 μs, or 1 MHz.

![](PNMPFull.files/image312.png)

**_Figure I-35 - Amplitude-versus-Frequency Response _**

Figure I-36 shows the resulting phase-versus-frequency response caused by the
micro-reflection in Figure I-34. The maximum phase excursion occurs when the
vector sum vector is tangent to the circle on a phasor diagram representation
of the incident and reflection vectors. That forms a right-triangle with _side
c_-the hypotenuse-equal to 1.0 (incident signal vector length); _side b_-the
opposite side-equal to 0.5 (reflection vector length), and _side a_-the
adjacent side-equal to 0.886 (vector sum length). Trigonometry can be used to
calculate the peak phase excursion, which equals the right-triangle’s angle B:
**sinB = opp/hyp**, or **angle B = arcsine(opp/hyp)**: arcsine(0.5/1) = 30o.

![](PNMPFull.files/image314.png)

**_Figure I-36 - Phase-versus-Frequency Response _**

In order to cancel the echo and get a flat response, an adaptive equalizer
with the opposite amplitude (magnitude)-versus-frequency and phase-versus-
frequency response is needed. Figure I-34

Figure I-37 shows the required amplitude and phase response to cancel the -0.5
amplitude 1 μs echo.

![](PNMPFull.files/image316.png)

**_Figure I-37 - Required Magnitude-and Phase-versus-frequency Response to Cancel Echo _**

Why is the peak-to-peak linear magnitude of the needed opposite amplitude-
versus-frequency response 0.667 to 2.0 rather than the original 0.5 to 1.5?

A time-invariant system such as a filter can be characterized by its impulse
response _h_(_t_) or by its frequency response _H_(_f_), which comprise what
is known as a Fourier transform pair. Flat response occurs when _H_(_f_)
multiplied by 1/_H_(_f_) equals 1.00. If _H_(_f_) is 0.5, then 1/_H_(_f_) is
2.0; likewise, if _H_(_f_) is 1.5, then 1/_H_(_f_) is 0.667. In the example in
the figure, 0.5 x 2 = 1.00 and 1.5 x 0.667 = 1.00.

For this example, use a simple 4-tap adaptive equalizer to compensate for the
impaired frequency response caused by the -0.5 amplitude 1 μs echo. The first
adaptive equalizer tap will be the main tap, so b0 will have a gain of 1. Note
that there is no delay element feeding the first equalizer tap.

![](PNMPFull.files/image318.png)

**_Figure I-38 - Adaptive Equalizer that will be Used in the Example in the Text _**

Assume the algorithm has converged on a solution that derived the following
coefficients: b0 = 1.0, b1 = +0.5, b2 = +0.25, and b3 = +0.125, and each delay
element Z-1 equals 1 μs.15

An analog equivalent of what’s going on here is something like the following:
Each of the Z-1 delay elements is equivalent to about 1,000 feet of “lossless”
coaxial cable (1 foot of cable has about 1 nanosecond of delay, so 1,000 feet
of coax delays the signal by approximately 1,000 nanoseconds or 1 μs). Each
multiplier is equivalent to a variable attenuator. Attenuator b0 is adjusted
for no attenuation (unity gain), b1 is adjusted to attenuate the signal by a
factor of half, b2 by a factor of one-fourth, and so on. Each of the Σ summing
circuits can be thought of as backwards two-way splitters functioning as
combiners, except that these, too, are assumed to be “lossless” for this
example. Keep in mind that this analog equivalent is just that-an equivalent.
A real-world adaptive equalizer is actually a digital circuit.

Figure I-39 shows the operation of the adaptive equalizer’s first tap, which
in this example also is the main tap. The unequalized input signal (1.0
amplitude incident signal and -0.5 amplitude 1 μs echo) does not pass through
a delay element, but does pass through multiplier b0. Since the b0’s
coefficient is 1, the output of b0 is identical to the input. The unaltered
incident signal and its echo are routed to one input of the first summing
circuit.

![](PNMPFull.files/image320.png)

**_Figure I-39 - Operation of the Adaptive Equalizer's First Tap _**

Figure I-40 shows the second tap’s operation. The unequalized input signal
passes through the first delay element Z-1, which delays the incident signal
and echo by 1 μs. The delayed incident signal and echo next pass through
multiplier b1, which has a coefficient of +0.5. The delayed incident signal
and echo are multiplied by +0.5, which decreases the amplitude of the incident
signal from 1.0 to 0.5, and the echo from -0.5 to -0.25. The delayed and
attenuated incident signal and echo are routed to the second input of the
first summing circuit.

![](PNMPFull.files/image322.png)

**_Figure I-40 - Operation of the Adaptive Equalizer's Second Tap _**

The first summing circuit combines the original undelayed, unattenuated
incident signal and its echo with the delayed and attenuated incident signal
and echo from the second tap. The output of the first summing circuit, which
is connected to an input of the second summing circuit, has the original
incident signal at amplitude 1.0, and a residual -0.25 amplitude 2 μs echo.
The original -0.5 amplitude 1 μs echo was cancelled (-0.5 + 0.5 = 0). This is
illustrated in Figure I-41.

![](PNMPFull.files/image324.png)

**_Figure I-41 - Summing the Outputs of the Adaptive Equalizer's First and Second Taps _**

Figure I-42 shows the operation of the adaptive equalizer’s third tap. The
unequalized input signal passes through the first and second delay elements,
which together delay the incident signal and echo by a total of 2 μs. The
delayed incident signal and echo next pass through multiplier b2, which has a
coefficient of +0.25. The twice-delayed incident signal and echo are
multiplied by +0.25, which decreases the amplitude of the incident signal from
1.0 to 0.25, and the echo from -0.5 to -0.125. The delayed and attenuated
incident signal and echo are routed to the second input of the second summing
circuit.

![](PNMPFull.files/image326.png)

**_Figure I-42 - Operation of the Adaptive Equalizer's Third Tap _**

Referring to Figure I-43, the combined signal from the first summing circuit
(1.0 amplitude incident signal and -0.25 amplitude 2 μs echo) and the delayed
and attenuated signal from the adaptive equalizer’s third tap (0.25 amplitude
incident signal and -0.125 amplitude echo) are combined in the second summing
circuit. The output of the second summing circuit, which is connected to an
input of the third summing circuit, has the original incident signal at
amplitude 1.0, and a residual -0.125 amplitude 3 μs echo. The - 0.25 amplitude
2 μs echo was cancelled (-0.25 + 0.25 = 0).

![](PNMPFull.files/image328.png)

**_Figure I-43 - Summing the Output of the Adaptive Equalizer's Third Tap With the Previously Summed First and Second Taps _**

Figure I-44 shows the operation of the fourth tap. The unequalized input
signal passes through the first, second and third delay elements, which
together delay the incident signal and echo by a total of 3 μs. The delayed
incident signal and echo next pass through multiplier b3, which has a
coefficient of +0.125. The delayed incident signal and echo are multiplied by
+0.125, which decreases the amplitude of the incident signal from 1.0 to
0.125, and the echo from -0.5 to -0.0625. The delayed and attenuated incident
signal and echo are routed to the second input of the third summing circuit.

![](PNMPFull.files/image330.png)

**_Figure I-44 - Operation of the Adaptive Equalizer's Fourth Tap _**

The combined signal from the second summing circuit (1.0 amplitude incident
signal and -0.125 amplitude 3 μs echo) and the delayed and attenuated signal
from the fourth tap (0.125 amplitude incident signal and -0.0625 amplitude
echo) are combined in the third summing circuit. The output of the third
summing circuit is the equalized output signal, which has the original
incident signal at amplitude 1.0, and a residual -0.0625 amplitude 4 μs echo.
The -0.125 amplitude 3 μs echo was cancelled (-0.125 + 0.125 = 0). See Figure
I-45.

![](PNMPFull.files/image332.png)

**_Figure I-45 - Final Summing Process Provides an Equalized Output _**

The original -0.5 amplitude echo was reduced to an amplitude of -0.0625, or an
18 dB improvement: 20log(-0.5/-0.0625) = 18.06 dB. The echo also was shifted
in time (delayed) to 4 μs from the original 1 μs.

Figure I-46 shows the resulting amplitude-versus-frequency and phase-versus-
frequency response after the 4-tap equalizer has compensated for the original
-0.5 amplitude 1 μs echo. The residual echo is - 0.0625 amplitude at 4 μs,
which results in the response shown in the figure. The amplitude (or magnitude
)-versus-frequency response is now 1.87 dB, compared to the original 9.54 dB.
The phase- versus-frequency response now is ±3.58 degrees, compared to the
original ±30 degrees. Note that the amplitude and phase ripple, which was 1
MHz before, is now 250 kHz.

![](PNMPFull.files/image334.png)

**_Figure I-46 - Final Amplitude and Phase-versus-frequency Response After Adaptive Equalization _**

**I.11 Adaptive Pre-equalization **

As noted in the Adaptive Equalization tutorial section, all QAM receivers-
whether in a digital set-top, cable modem, QAM analyzer, or even the upstream
receiver of a cable modem termination system (CMTS)-incorporate a circuit
known as an adaptive equalizer. The purpose of an adaptive equalizer is to
compensate for channel response impairments, by creating what amounts to a
digital filter with the opposite response of the channel through which the QAM
signal was transmitted. It’s called “adaptive” because the equalizer can
change its characteristics on the fly, should channel response conditions
change for some reason.

A cable modem or digital set-top uses a blind adaptive equalizer in the
device’s downstream QAM receiver. DOCSIS 1.1, 2.0 and later cable modems are
capable of equalizing-or more accurately, pre- equalizing-the upstream signal
_prior _to transmission to compensate for channel response impairments. DOCSIS
1.1 supports 8-tap upstream pre-equalization, and DOCSIS 2.0 supports 24-tap
upstream pre- equalization.16

Since a cable modem is essentially a dumb box, it has no way of knowing what
the upstream channel response is! So, ranging and station maintenance bursts
transmitted by the modem are evaluated by the CMTS. The CMTS upstream receiver
has its own adaptive equalizer, from which it derives equalizer coefficients
that are transmitted to each modem. The modems, in turn, use those equalizer
coefficients to configure their internal adaptive pre-equalizers to have the
opposite response of the upstream channel. The “predistorted” signal is then
transmitted by the modem, and in theory is received at the CMTS unimpaired.

You might ask why even bother with pre-equalization? Why not let the CMTS
equalize each received signal? Well, the CMTS can do that (in fact, it does),
but pre-equalization lets the modems do most of the adaptive equalization
process’s heavy lifting.

Here’s an example. The upstream QAM signal from a given modem has several dB
of in-channel tilt because of some problem in the outside plant. The CMTS
“sees” that tilt and gives that modem the appropriate coefficients so that the
modem can pre-equalize or tilt its transmitted QAM signal approximately the
same amount in the OPPOSITE direction. When that pre-equalized QAM signal is
received by the CMTS, it should now be flat. Refer to Figure I-47, which shows
an upstream 6.4 MHz bandwidth 64-QAM signal as received at the CMTS. Note the
substantial in-channel tilt before pre- equalization, and the same signal-now
nearly flat-after pre-equalization.

![](PNMPFull.files/image336.png)

**_Figure I-47 - Upstream Pre-equalization is Able to Compensate for In-channel Tilt _**

**I.12 Velocity of Propagation **

Electromagnetic waves travels through a vacuum at the speed of light,
299,792,458 meters per second (983,571,056 feet per second). This is known as
the free-space value of the speed of light. Since radio waves are part of the
electromagnetic spectrum, they travel at the speed of light, too. But what
happens when radio waves travel through coaxial cable? Their velocity is
somewhat slower than it is in a vacuum! Indeed, radio waves travel through
trunk and feeder-type coaxial cable at approximately 87% of the free space
value of the speed of light, or 260,819,438 meters per second (855,706,819
feet per second). Looking at this another way, radio waves travel 1 foot in a
vacuum in 1.02 nanosecond (ns), and through 1 foot of coaxial cable in 1.17
ns.

Why do radio waves travel more slowly through coaxial cable than they do
through a vacuum? First, the conductors used in coaxial cable are not perfect.
The loss in those conductors slows down the waves slightly, but the effect is
almost negligible at frequencies used in cable networks. Of more importance is
the effect of the dielectric material which separates the coaxial cable’s
center conductor and shield. Indeed, the presence of a dielectric other than a
vacuum or air reduces the velocity of an electromagnetic wave, often by 10% to
20% or more.

The ratio of the velocity of an electromagnetic wave-specifically what is
known as a transverse electromagnetic (TEM) mode wave-in a vacuum to its
velocity in a dielectric material, νTEM(vacuum)/νTEM(dielectric), equals what
is called index of refraction.17 Velocity factor is the reciprocal of index of
refraction.

The dielectric’s magnetic permeability (represented by the symbol μ and
expressed in henrys/meter) and electric permittivity (represented by the
symbol ε and expressed in farads/meter) are two key properties that determine
the velocity of electromagnetic waves in coaxial cable. The ratio of
ε(dielectric)/ε(vacuum) is the dielectric constant εr. The velocity of an
electromagnetic wave in a dielectric is equal to the ratio of its velocity in
a vacuum to the square root of the dielectric constant: νTEM(dielectric) =
νTEM(vacuum)/√εr. A little number crunching with the latter equation and the
ratio that defines index of refraction is 1/√εr = velocity factor.

The dielectric constant εr of the coaxial cable in the example in the first
paragraph is approximately 1.32, so the velocity factor is 1/√1.32 = 0.87.
Velocity of propagation is velocity factor expressed as a percentage. So, a
velocity factor of 0.87 is 87% velocity of propagation, which means that
radios waves travel through the coaxial cable at 87% the free-space value of
the speed of light.

One application for understanding velocity of propagation is calculating
propagation or transit delay in a cable network-that is, the time it takes for
electromagnetic waves to travel from one point to another.

The Data-Over-Cable Service Interface Specification (DOCSIS®) _Radio Frequency
Interface Specification _includes assumed downstream and upstream RF channel
transmission characteristics for cable networks. Among those assumed
characteristics is the previously mentioned transit delay. For instance, the
transit delay from the headend to the most distant customer is assumed to be
less than or equal to 0.800 millisecond (ms)_. _Note that 0.800 ms (800
microseconds) is a one-way specification. The same assumed transit delay also
applies in the upstream direction.

The approximate downstream or upstream transit delay can be calculated if one
knows the length of the optical fiber link between the headend or hub and
node, as well as the length of distribution network coaxial cable from the
node to the most distant customer. The calculation is done using the
reciprocal of the fiber’s index of refraction-its velocity factor, which is
then converted to velocity of propagation-and the velocity of propagation of
the coaxial cable. The approximate index of refraction for single mode optical
fiber at 1310 nm is 1.46, making its velocity factor 0.68 and its velocity of
propagation 68%. In other words, light propagates through the optical fiber at
a velocity that is 68% of the speed of light in a vacuum. A typical velocity
of propagation for commonly used hardline distribution-type coaxial cables is
the previously discussed 87%.

Since the speed of light in a vacuum is 299,792,458 meters per second, 68% of
that value is 203,858,871 meters per second. Thus, light will propagate
through 203,858,871 meters of optical fiber in one second. For coaxial cable
with a velocity of propagation of 87%, RF will propagate through 260,819,438
meters of coax in one second.

Example: Assume a cable system with an optical fiber link from headend to node
that is 30 kilometers (km) long. The coaxial cable distribution network
connected to the node has a coax run that extends an additional 2 km beyond
the node. What is the approximate transit delay from the headend to the most
distant customer, excluding delay through active and passive devices?

Solution: Light propagates through 30 km (30,000 meters) of optical fiber in
1.47 x 10-4 second (30,000 meters/203,858,871.44 meters per second =
0.00014716 second). RF propagates through 2 km (2,000 meters) of coax in
7.6681 x 10-6 second (2,000 meters/260,819,438.46 meters per second =
0.00000076681 second). Combining these two numbers yields 1.55 x 10-4 second,
or 0.155 ms. This is well within the DOCSIS one-way transit delay
specification of 0.800 ms.

Table I-2 summarizes transit delay in ns-per-foot and ns-per-meter for several
values of velocity of propagation. The velocity factor of a vacuum is 1.0 and
its velocity of propagation is 100%, because electromagnetic signals travel at
the free-space value of the speed of light.

The dielectric constant of dry air at a pressure of one atmosphere and a
temperature of 23° C is 1.00068, so the velocity factor is 1/√1.00068 =
0.999660173 and the velocity of propagation is 99.966%. The values for a
vacuum and air are usually considered to be the same in all but the most
critical applications because of the negligible difference between them.

**_Table I-2 - Velocity of Propagation versus Transit Delay _**

![](PNMPFull.files/image338.png)

Typical published velocities of propagation for modern foam dielectric coaxial
cables used by the cable industry are 84-85% for drop-type cables and 87-88%
for hardline trunk and feeder cables. Published values for disc-and-air
dielectric designs are as high as 93%. As previously noted, the typical
velocity of propagation for single mode optical fiber at 1310 nm is about 68%.

**I.13 Fourier Transforms FFT and DFT **

This section provides a non-mathematical explanation of the DFT and FFT. It
emphasizes DOCSIS 3.1 OFDM, but it also provides a general explanation
including spectral analysis, modulation and demodulation using the FFT.

**What is the FFT? **The fast Fourier transform (FFT) is a fast way to compute the discrete Fourier transform (DFT). The FFT is about 600 or 1200 times faster than direct computation of the DFT for DOCSIS 3.1 block length 4096 or 8192, respectively. Often the abbreviations FFT and DFT are used almost interchangeably. 

**What is the DFT? **The DFT is a way of expressing any waveform in terms of sine waves. The DFT breaks down a signal into many sine waves. It is used in a DOCSIS 3.1 OFDM receiver, in which a single DFT implements 4096 or 8192 demodulators. It is also used for spectrum analysis at the CM or CMTS, in which the DFT calculates the frequency content of the cable plant signal. The inverse DFT (IDFT) does the reverse: it sums many sine waves to construct a signal. It is used in a DOCSIS 3.1 OFDM transmitter, in which a single DFT implements 4096 or 8192 modulators and their combining network. 

**How does the DFT computation work? **To apply the DFT just multiply by a matrix. Multiplying by this matrix converts between the time and frequency domains, and performs modulation, demodulation and spectrum analysis. 

**What does the DFT matrix look like? **The DFT matrix simply contains rows of sine and cosine waves as shown in Figure I-48 for N = 16 rows. Just half of the matrix is shown in the figure. Each row has a slightly higher frequency (contains one more full cycle) than the previous row. The first row in the figure represents DC, that is, zero cycles; the next row one full cycle, the next two full cycles, etc., up to seven full cycles. 

![](PNMPFull.files/image340.png)

**_Figure I-48 - DFT Matrix (Only Half is Shown) Contains Rows of Sine (Red) and Cosine (Blue) Waves _**

To be more complete, Figure I-49 shows the full DFT matrix for N = 16. The DC
signal (corresponding to the center frequency at RF) shows up in the 9th row.
The rows below DC have sine leading cosine and the rows above DC have sine
lagging cosine. This allows the DFT to distinguish between positive and
negative frequencies, that is frequencies greater or less than the RF center
frequency.

![](PNMPFull.files/image342.png)

**_Figure I-49 - Full DFT Matrix for N = 16 _**

What does the IDFT matrix look like? The IDFT matrix is identical to the DFT
matrix with its sines negated, and it typically has a different scale factor.

How big is the DFT matrix for DOCSIS 3.1 OFDM? The simple example in Figure
I-49 shows the DFT matrix with N = 16 rows. In DOCSIS 3.1 the DFT matrix is
much larger, containing N = 4096 or 8192 rows of sine and cosine waves. To
give some idea of the size of the DOCSIS 3.1 DFT, Figure I-50 shows a DFT
matrix with N = 64. This is getting close to the limit of what can be shown
clearly in a diagram. Figure I-51 shows a DFT matrix with N = 256, and is way
too dense to see clearly, yet is still much smaller than N = 4096 or 8192 for
DOCSIS 3.1.

![](PNMPFull.files/image344.png)

**_Figure I-50 - This DFT Matrix with N = 64 is about the Largest We can Clearly Show in a Small Diagram _**

![](PNMPFull.files/image346.png)

**_Figure I-51 - This DFT Matrix with N = 256 is Still Nowhere Near N = 4096 or 8192 for DOCSIS 3.1 _**

**How does a DOCSIS 3.1 OFDM transmitter use the IFFT? **We start with 4096 or 8192-QAM symbols. Multiply by the IDFT matrix; actually use the IFFT which is 600 to 1200 times faster to give the same answer as the IDFT. This gives the equivalent of 4096 or 8192-QAM modulators summed together, as shown in Figure I-52 - very powerful! We send this summed signal over the cable channel. A guard interval, also called a cyclic prefix, is typically added to the signal to improve echo tolerance. A guard interval is nothing more than a number of time samples copied from the front of the waveform and appended to the end of the waveform. Ideally, the longest echo in a channel is shorter than the length of the guard interval. 

![](PNMPFull.files/image348.png)

**_Figure I-52 - OFDM Transmitter: a Single IDFT is Equivalent to 4096- or 8192-QAM Modulators plus their Summing Network _**

**How does a DOCSIS 3.1 OFDM receiver use the FFT? **We start with 4096 or 8192 samples received from the cable channel. Multiply by the DFT matrix using the FFT which is 600 to 1200 times faster. This gives the equivalent of 4096 or 8192-QAM demodulators, as shown in Figure I-53. The resulting 4096 or 8192- QAM soft decisions are sent to the de-interleaver and FEC for error correction, then to the MAC. 

![](PNMPFull.files/image350.png)

**_Figure I-53 - OFDM Receiver: a Single DFT is Equivalent to 4096- or 8192-QAM Demodulators _**

**How does the FFT save so much computation compared to the DFT? **The FFT uses a divide-and-conquer strategy. Say we want to multiply by a DFT matrix with N = 4096. This takes 4096*4096 = 16 million complex multiplications, since the input vector has to be multiplied by each row of the matrix, there are N rows, and each row has N elements. The trick is to break the DFT down into two DFTs each of half size, or 2048 rows each, and combine the two to get the original DFT. This takes 2048*2048 operations for the first half and 2048*2048 for the second half, for a total of 8 million operations, plus the combining which is actually small enough to be neglected. So, we gained almost a factor of 2x by breaking the DFT in half. If that worked so well, why not do it again and get another factor of 2 improvement? In fact, we keep dividing 4096 by 2 over and over (12 times which is log2(4096)) until we end up with 4096 trivial DFTs of length 1, and the 1-point DFT of a number is just the number itself. The above description is a little simplified; the actual number of operations required for the FFT is usually counted as (N/2) log2(N), compared to N^2 for direct computation of the DFT. Table I-3 shows the actual numbers for the two DOCSIS 3.1 transform lengths. 

**_Table I-3 - The FFT is 600 to 1200 Times Faster than the DFT for DOCSIS 3.1 OFDM Transforms _**

![](PNMPFull.files/image352.png)

**What are two fundamental ways to interpret a matrix multiplication? **Recall that the DFT or IDFT multiplies the input vector by the DFT or IDFT matrix. This matrix multiplication can be looked at in one of two ways: 

(1) a series of dot products (2) a weighted sum of the rows of the matrix

The dot-product interpretation lends itself to demodulation or spectral
analysis using the DFT. The weighted-sum interpretation is a natural for
modulation using the IDFT. Recall that the DFT and IDFT are basically the same
matrix (except the IDFT has its sines negated and a constant scale factor), so
there is no fundamental difference between the computations of the DFT and
IDFT.

**How can we interpret a matrix multiplication as a series of dot products? **The multiplication of the input vector by the DFT matrix can be thought of as a “dot product” of the input vector with each row of the matrix. A dot product of two vectors is the sum of the individual pairwise products of the elements of the vectors. As a simple example with N = 4, the dot product of the two vectors [1,2,3,4] and [5,6,7,8] is 

1*5 + 2*6 + 3*7 \+ 4*8 = 70

The two input vectors to a dot product have N elements each and the dot
product gives a single number as its output. For the DFT matrix with N = 4096,
the 1st element of the DFT output vector is the dot product of the input
vector with the 1st row of the DFT matrix. The 2nd element of the DFT output
vector is the dot product of the input vector with the 2nd row of the DFT
matrix. And so on; the 4096th element of the DFT output vector is the dot
product of the input vector with the 4096th row of the DFT matrix. In the
above Figure I-53 showing an OFDM receiver, each individual “QAM receiver”
block is a dot product of the input with a single row of the matrix
corresponding to one subcarrier.

**How does the DFT perform demodulation? **Demodulation utilizes the fact that the dot product acts as a correlator. Correlation is the comparison of two signals to see how similar they are. If the input signal closely matches a particular DFT sine/cosine row, its dot product with that row will have a large magnitude. Conversely, if the input signal does not match up with the sine/cosine wave, the dot product will be small. So, by taking the dot product of the input vector with each sine/cosine row of the DFT matrix, we are asking the question, “How does the input vector correlate with each row, that is, with each frequency?” Each individual dot product or correlation can be positive or negative. We get a separate correlation of the input with the DFT cosine wave (I) and sine wave (Q). When we plot the I and Q components of the dot product on x and y axes, we get a soft decision, that is, a point on the received QAM constellation diagram, not necessarily landing exactly on one of the constellation symbols. Correctly determining which constellation point was sent by the transmitter gives us the data bits for output to the FEC. 

**How can we interpret a matrix multiplication as a weighted sum of rows? **Instead of interpreting the DFT matrix multiplication as a series of dot products with the input vector, we can take the exact same computation and interpret it as the weighted sum of the rows of the IDFT matrix, where the weights are QAM symbols. To do this, we interpret each element of the input vector as a QAM symbol. We interpret each row of the IDFT matrix as a carrier wave at a particular frequency; this is easy to visualize looking at Figure I-53 above, which show the sine and cosine waves in the rows of the matrix. 

**How does the DFT perform modulation? **The goal is to modulate the input QAM symbols onto the respective carriers. We take the 1st row of the IDFT matrix and multiply every element of this row by the 1st QAM symbol. This modulates the 1st QAM symbol to the carrier frequency of the 1st row. Take the 2nd row of the IDFT matrix and multiply every element of this row by the 2nd QAM symbol. This modulates the 2nd QAM symbol to the carrier frequency of the 2nd row. And so forth for all the carriers. This gives us 4096 or 8192-QAM modulators. We then sum all these modulator outputs to get a single composite signal. This summation, analogous to a large RF combining network, comes for free as part of the matrix multiplication. So, multiplication by the IDFT matrix is equivalent to 4096 or 8192-QAM modulators plus their combining network. In the above figure showing an OFDM transmitter, each individual “QAM modulator” block is the product of an input QAM symbol with a single row of the matrix corresponding to one subcarrier. 

**What about complex arithmetic? **The DFT uses complex multiplication, in which each complex number consists of a pair of real numbers: the real or I (in-phase) component, and the imaginary or Q (quadrature) component. Equivalently, in polar form each complex number consists of an amplitude and a phase relative to the RF center frequency. The multiplication of two complex numbers requires 4 real multiplications and two real additions. In this tutorial we have not placed emphasis on this mathematical detail, but a web search will provide further information on complex arithmetic for the interested reader. 

**How is the DFT/FFT used for spectrum analysis? **A spectrum analyzer is a device which measures the frequency content of an input signal. Fortunately, this is precisely what the DFT does. Multiplying by the DFT matrix measures the correlation (dot product) of the input signal with each row in the DFT matrix, and each row is a sine/cosine of a particular frequency. Thus, each output bin gives the frequency content at that frequency. 

Figure I-54 shows a block diagram of a digital spectrum analyzer which may
reside in the CM or CMTS. The input signal enters at the left of the diagram;
this signal is the full upstream or downstream band of the cable plant. An
analog front end amplifies the signal and provides RF gain control. A high-
speed analog-to- digital converter (ADC), typically 2.5 Gsps or higher,
provides digital samples of the signal. A digital tuner, consisting of digital
oscillator and lowpass filter, selects the desired analysis band around a
specified center frequency, and outputs complex (I and Q) sample values. The
signal from the selected band is applied to the FFT, which multiplies the
signal by the DFT matrix as described in earlier sections. Each bin of the FFT
output consists of a complex value consisting of two numbers, real (I) and
imaginary (Q), giving the correlation of the input signal with the particular
frequency corresponding to a single row of the DFT matrix. Typically a
spectrum analyzer is only concerned with the magnitude, not the phase, of the
FFT output. So, the power (magnitude-squared) of each bin is computed, that
is, I^2 + Q^2 for each bin. If spectrum smoothing (time averaging) is to be
applied, the above process is repeated with a fresh set of data from the same
band, and the power values from several captures are averaged at each bin
location. The smoothed bins are converted to dB by taking 10*log10 of each bin
power value. These dB values, one for each frequency bin, are displayed as the
spectrum of the input signal.

![](PNMPFull.files/image354.png)

**_Figure I-54 - Block Diagram of a Digital Spectrum Analyzer _**

Note that if the spectrum analyzer is able to process the entire signal in one
shot as a single analysis band, the tuner is not necessary. The tuner is
useful to provide a selectable spectrum analysis center frequency and span,
that is, the ability to zoom into a particular portion of the band for
detailed analysis. If a narrow span is selected, the output sample rate may be
reduced in accordance with the sampling theorem. The sampling theorem states
that a sample rate of real samples greater than twice the signal bandwidth, or
a sample rate of complex (I and Q) samples greater than the signal bandwidth,
is adequate to represent the signal without loss of information. If the band
is being analyzed in pieces, then the tuner is used to step through a sequence
of center frequencies corresponding to multiple analysis segments of the band,
and the individual spectrum segments are spliced together to produce the
overall wideband spectrum.

Figure I-55 shows a full-band spectrum as seen at the CM. The horizontal axis
is in MHz, and the vertical axis is in dB. This spectrum was spliced together
from approximately 100 analysis segments, each of width 7.5 MHz. Time
averaging of approximately 16 captures was used to smooth the spectrum plot.

![](PNMPFull.files/image356.png)

**_Figure I-55 - Full-band Spectrum as seen at the CM _**

**What is windowing? **Recall that the DFT matrix of Figure I-48 consists of rows of sines and cosines, with each row containing a whole number of cycles. If the input signal happens to be a sine wave (CW) with a frequency exactly equal to one of the rows of the DFT matrix, it will correlate perfectly with that row and have zero correlation with the other rows. However, what happens if the frequency of the input signal falls somewhere between two DFT rows, or “off bin”? (This is actually the most likely case.) In this case the signal will correlate slightly with all the DFT rows. This will cause what is called “spectral leakage” wherein an off-bin CW signal, instead of producing a single spike in the spectrum, produces a large number of spikes. 

To solve the spectral leakage problem, a data-tapering window is often used. A
window is a sequence with gradual reduction at the edges that is multiplied by
the input signal before the signal is multiplied by the DFT matrix. Its
purpose is to taper the ends of the input signal vector, providing a smooth
transition to zero at the two ends. Tapering reduces spectral leakage and
causes a CW signal to produce a compact spectral spike, as we are used to when
using an analog spectrum analyzer. There is a catch; the spectral spike for a
CW signal with windowing is slightly wider than it would be without windowing,
implying that windowing slightly degrades the resolution of the spectrum
measurement. Figure I-56 shows some typical window functions. An example of a
popular window is the Hanning window, which has a raised-cosine shape that is
zero at both ends and rises smoothly to one in the center. The resolution
bandwidth of a Hanning window is 1.5 times the FFT bin spacing, an example of
the reduction in resolution due to windowing.

![](PNMPFull.files/image358.png)

**_Figure I-56 - Typical Data-tapering Window Functions _**

**Appendix II SNMP General Collection Methodology **

The fundamental requirements of the SNMP protocol are:

network access (UDP/IP, port 161) community string IP address of each cable
modem and/or CMTS Correctly formatted object identifiers (OIDs), including
proper indexing

The initial CMTS step may be excluded if only the modem data is being
considered for analysis. Otherwise, starting with the MAC address of the cable
modem and the IP address of the CMTS, the pointer of the modem index must be
resolved. This is achieved by passing the decimal formatted MAC address to the
CMTS by way of the docsIfCmtsCmPtr MIB.

Example: MAC = AA:BB:CC:00:11:22, converted to decimal would be
170.187.204.0.17.34

The SNMP command formation might look like this: snmpget -v2c -c $COMMUNITY
$CMTS_IP 1.3.6.1.2.1.10.127.1.3.7.1.2. 170.187.204.0.17.34

The resulting value would be the modem index required to obtain the IP
address, coefficients, and other upstream information from the CMTS.
Subsequent queries to the docsIfCmtsCmStatusTable will require this modem
index. To obtain the modem IP and equalization data from the CMTS, a single
SNMP query may be made by requesting the docsIfCmtsCmStatusIpAddress and
docsIfCmtsCmStatusEqualizationData. Both of these OIDs require the previously
obtained modem index. Example:

snmpget -v2c -c $COMMUNITY $CMTS_IP 1.3.6.1.2.1.10.127.1.3.3.1.3.$INDEX
1.3.6.1.2.1.10.127.1.3.3.1.8.$INDEX

The resulting values will be the IP address of the cable modem and also the
upstream pre-equalization coefficients as viewed by the CMTS.

Having the IP address of the modem, the three required values may be obtained
by a query to UpstreamFrequency, UpstreamWidth and
docsIfCmStatusEqualizationData. An example of this command formation would be:

snmpget -v2c -c $COMMUNITY $MODEM_IP 1.3.6.1.2.1.10.127.1.1.2.1.2.4
1.3.6.1.2.1.10.127.1.1.2.1.3.4 1.3.6.1.2.1.10.127.1.2.2.1.17.2

**Appendix III SNMP MIB for Equalization PNM **

REQUIRED FROM MODEM:

1.3.6.1.2.1.10.127.1.1.2.1.2.4 UpStreamFrequency

1.3.6.1.2.1.10.127.1.1.2.1.3.4 UpStreamWidth

1.3.6.1.2.1.10.127.1.2.2.1.17.2 docsIfCmStatusEqualizationData

OPTIONAL FROM MODEM:

1.3.6.1.2.1.1.1 sysDescr

1.3.6.1.2.1.1.2 sysObjectID

1.3.6.1.2.1.1.3 sysUpTime

1.3.6.1.2.1.10.127.1.1.4.1.2.3 docsIfSigQUnerroreds

1.3.6.1.2.1.10.127.1.1.4.1.3.3 docsIfSigQCorrecteds

1.3.6.1.2.1.10.127.1.1.4.1.4.3 docsIfSigQUncorrectables

1.3.6.1.2.1.10.127.1.2.2.1.12.2 docsIfCmStatusT3Timeouts

1.3.6.1.2.1.10.127.1.2.2.1.13.2 docsIfCmStatusT4Timeouts

1.3.6.1.2.1.10.127.1.2.2.1.4.2 docsIfCmStatusResets

1.3.6.1.2.1.10.127.1.2.2.1.5.2 docsIfCmStatusLostSyncs

1.3.6.1.2.1.10.127.1.1.4.1.5.3 docsIfSigQSignalNoise

1.3.6.1.2.1.10.127.1.1.5.0 docsIfDocsisBaseCapability

1.3.6.1.2.1.10.127.1.1.1.1.2.3 docsIfDownChannelFrequency

1.3.6.1.2.1.10.127.1.2.2.1.3.2 docsIfCmStatusTxPower

1.3.6.1.2.1.10.127.1.1.1.1.3.3 DownStreamWidth

1.3.6.1.2.1.10.127.1.1.1.1.4.3 docsIfDownChannelModulation

1.3.6.1.2.1.10.127.1.1.2.1.4.4 docsIfUpChannelModulationProfile

1.3.6.1.2.1.10.127.1.1.1.1.6.3 docsIfDownChannelPower

1.3.6.1.2.1.10.127.1.1.2.1.6.4 docsIfUpChannelTxTimingOffset

REQUIRED FROM CMTS:

1.3.6.1.2.1.10.127.1.3.7.1.2 docsIfCmtsCmPtr

1.3.6.1.2.1.10.127.1.3.3.1.3 docsIfCmtsCmStatusIpAddress

1.3.6.1.2.1.10.127.1.3.3.1.8 docsIfCmtsCmStatusEqualizationData

OPTIONAL FROM CMTS:

1.3.6.1.2.1.10.127.1.3.3.1.6 docsIfCmtsCmStatusRxPower

1.3.6.1.2.1.10.127.1.3.3.1.9 docsIfCmtsCmStatusValue

1.3.6.1.2.1.10.127.1.3.3.1.13 docsIfCmtsCmStatusSignalNoise

1.3.6.1.2.1.10.127.1.3.3.1.7 docsIfCmtsCmStatusTimingOffset

OPTIONAL FROM CMTS US:

1.3.6.1.2.1.2.2.1.2 ifDescr

1.3.6.1.2.1.10.127.1.1.2.1.19 docsIfUpChannelPreEqEnable

OPTIONAL FROM CMTS US (vendor specific):

1.3.6.1.4.1.4998.1.1.15.3.2.1.7  Arris specific upstream padding

1.3.6.1.4.1.9.9.116.1.4.1.1.6  Cisco specific upstream padding (divide by 10)

1.3.6.1.4.1.4981.2.1.2.1.1  Motorola/RDN specific upstream padding (divide by
10)

**Appendix IV Micro-reflection Calculator **

A simple micro-reflection calculator to derive the relation between the
amplitude ripple and the reflected wave level is shown here.

For simplification purposes it is assumed that the interference pattern
consists of the incident signal combined with a single reflected wave. For
this, take advantage of the voltage standing wave ratio (VSWR) definition and
others already in place.

The equivalent reflection coefficient is defined by

![](PNMPFull.files/image360.png)

Where Z0 is the characteristic impedance of the transmission line, in this
case 75 ohms, and ZE is the equivalent impedance of the reflected wave that
adds to and interferes with the incident signal.

It is considered an equivalent impedance because it contains the impact of the
reflection against two mismatched interfaces as well as the round trip
attenuation and delay between these two interfaces (See Figure IV-1).

![](PNMPFull.files/image362.png)

**_Figure IV-1 - Equivalent Reflection Coefficient ΓE _**

The VSWR, which is the ratio between Emax and Emin, reveals the ripple
magnitude. The VSWR in terms of the reflection coefficient is given by:

![](PNMPFull.files/image364.png)

Since VSWR is a ratio of voltages, to obtain the equivalent peak-to-valley
power ratio or ripple in dB, Ripple (dB) = 10log10(VSWR2)

Alternatively the process can be reversed by solving for ΓE in the previous
equation to obtain:

![](PNMPFull.files/image366.png)

The equivalent reflection coefficient ΓE provides the micro-reflection level
in dB in the following expression Micro-reflection Level (dB) = 10log10(ΓE 2)

**Appendix V Two Types of Echoes **

Portions of this Appendix were previously published in a February 2010 _CED
_magazine online article. An enhanced version of that article is included here
with permission of the authors.

_Upstream Cable Echoes Come In Two Flavors _

Thomas H Williams, ARRIS Group Alberto Campos, CableLabs Bruce Currivan,
Broadcom Charles Moore, Motorola

**V .1 Background **

CableLabs has established a “DOCSIS Proactive Network Maintenance” working
group with a goal of utilizing the data in DOCSIS-based communications systems
to improve plant operations. The group’s first task is to produce a
recommended practices document that enables cable operators to mine the
predistortion coefficients from the cable modem’s (CM) upstream adaptive
equalizer.

Cable lines typically have many small echoes, so-called micro-reflections,
which will disrupt digital transmissions if not canceled. This is particularly
true for high-speed upstream signals having a higher order modulation, such as
64-QAM, or having wider bandwidth, such as 6.4 MHz. The system chosen by
DOCSIS uses predistortion (or pre-equalization), where a burst transmission is
distorted prior to transmission, and arrives at a cable modem termination
system (CMTS) receiver with the plant’s distortion canceled. The idea is that
by reading the CM’s predistortion coefficients using a network management
system, technicians can tell what plant impairments a CM is compensating for,
and then compute what may be wrong with the cable plant. By reading the data
from many CMs you can localize the problems using maps or connectivity data.

The process of programming the predistortion coefficients in the CM is handled
during a periodic ranging process, which is controlled by the CMTS.

The group’s name, ‘DOCSIS Proactive Network Maintenance’, is somewhat limiting
since the techniques being developed show a reactive ability to speed time-to-
repair. The utility of the technique is that it can reduce expensive truck-
rolls, either reactively or proactively.

**V.2 Two Types of Echoes **

As a result of data presented in the DOCSIS Proactive Network Maintenance
face-to-face meetings and from data gathered in experiments, it appears that
upstream cable plant has two distinctly different types of echoes with
different mathematical properties. The first type is called multiple
recursion, and is created by two or more impedance discontinuities inside the
cable. This type of echo has a characteristic impulse response of a main
signal followed by several echoes, with each succeeding echo having smaller
amplitude. (An impulse response is nothing more than a time plot of how the
signal path would respond to a narrow voltage spike.) The second type is
called single recursion, where echoes that are created find two different
routes upstream. This type of echo has a characteristic impulse response of a
main signal followed by a single echo. The good news is that the existing
upstream adaptive equalizer corrects both automatically. Also, if the echoes
are not strong, only the first recursion is significant in both cases. For
example, the second recursion of a -20 dBc echo is -40 dBc, which is generally
below the noise threshold.

**V.3 Multiple Recursion Echoes **

In this echo situation, an upstream transmission gets bounced back and forth
between two impedance discontinuities. The multiple recursion echo may be
created in a situation such as is shown in the top of Figure V-1. An upstream
signal travels from right to left through an amplifier, a span of cable with
taps, and another amplifier. There are two impedance mismatches, labeled
reflection points, which cause a portion of the upstream signal to reflect
back and forth until the reflections eventually die out. The bottom of Figure
V-1 shows the impulse response of the upstream channel. Note that there is a
main signal, followed by multiple recursions, each caused by a re-reflection.
In this example, the echo is very strong, so there are many significant
recursions.

The multiple recursion scenario also has been observed in a drop cable, where
a filter on one end has bad upstream return loss, and a house on the other end
also has bad return loss due to un-terminated splitters. A CM’s transmission
from the house picks up multiple recursions.

![](PNMPFull.files/image368.png)

**_Figure V-1 - A Multiple Recursion Echo _**

**V.4 Multiple Recursion Lab Echoes **

The multiple recursion echo situation can be created in a lab environment with
the diagram shown in the top of Figure V-2. A pair of directional couplers is
chosen with tap values selected to adjust the strength of the echo. A cable
length is chosen to give the desired echo delay. The tap leg of each
directional coupler is left open to create a reflection. Assuming two-way
splitters are used with 3.5 dB of insertion loss on each leg, and cable loss
is 2 dB, 1st recursion echo strength is computed as:

Main path dB - echo path dB = (3.5 + 2.0 + 3.5) - (3.5 + 2.0 + 3.5 + 3.5 + 2.0
+ 3.5 + 3.5 + 2.0 + 3.5) = 9.0 - 25.0 = 16 dB.

![](PNMPFull.files/image370.png)

**_Figure V-2 - Wiring Diagrams to Make Echoes in a Lab _**

**V.5 Single Recursion Echo **

In this echo situation, the transmission finds two different paths upstream.
One scenario for this echo situation is illustrated in the top of Figure V-3.
A signal is being transmitted from a house into a 28 dB tap. Unfortunately
this tap has a port-to-output isolation of only 35 dB. The CM’s signal travels
upstream attenuated by the tap’s value (28 dB), but the signal also travels
downstream attenuated by only 35 dB. When the signal reaches the end of the
line it encounters a two-way splitter which is not terminated. The lack of a
termination causes the signal to reflect back upstream where it rejoins, after
some time delay, the main signal. Because the input return loss of the
amplifier and 28 dB tap is excellent, there is no further recursion of the
echo. The resulting impulse response is shown at the bottom of Figure V-3.

![](PNMPFull.files/image372.png)

**_Figure V-3 - A Single Recursion Echo Example _**

**V.5.1 Creating a Single Recursion Echo **

A single recursion echo can be created using the wiring diagram in the bottom
of Figure V-2. A signal is split by the first splitter on the left. One leg of
the left splitter connects to a short piece of cable and the other connects to
a long piece of cable. The ends of the two cables are combined to make an
output signal in the right combiner. An attenuator (not shown) may be put in
line with the long piece of cable to further attenuate the echo to a desired
amplitude.

**V.5.2 Echo Cancelation with Single and Multiple Recursion Echoes **

It is well known by digital signal processing engineers that a single
recursion echo can be canceled by an adaptive equalizer with enough taps to
handle all of the significant recursions created in the equalizer, and that
several recursions may be needed to cancel a strong echo. Multiple recursions
are necessary to cancel a single echo because the adaptive equalizer sums an
echo-corrupted received signal with a delayed echo- corrupted copy. The
equalizer cancels the first recursion of the echo, but the echo in the delayed
signal is not canceled. So yet another recursion is needed to take out the
echo in the signal the equalizer used for cancelation, and so forth, repeating
endlessly.

It is suspected (and confirmed by preliminary field and lab data) that under
the proper conditions, a multiple recursion echo can be canceled by a
predistorted signal with only one recursion. How this works is explained in
Figure V-44. This diagram is a snapshot in time. At the illustrated point in
time, a main signal’s impulse already has propagated upstream past point A. A
reflection created at REFLECTION POINT A has propagated backwards and is now
at point C. The CM has already transmitted an inverse first recursion, shown
at point D. When the signals propagating from point C and point D meet at
REFLECTION POINT B they sum together and cancel. End of echo, period. No more
recursions.

![](PNMPFull.files/image374.png)

**_Figure V-4 - How A Multiple Recursion Echo can be Canceled with Predistortion _**

**V.5.3 The Math **

A multiple recursion echo may be modeled as:

1+_a_+_a_2 +_a_3 +_a_4 +.....

REFLECTION POINT A

REFLECTION POINT B

where 1.0 is the main signal amplitude and ‘a’ is the first echo’s amplitude
in linear terms. That is, for a -3 dBc echo a = 0.707. The ‘a2’, ‘a3’, ‘a4’
components and so on represent respectively the amplitude of the recurring
second, third, fourth and higher order echoes. In a baseband channel ‘a’ is
real, but in an RF channel ‘a’ may be complex. To be more precise,

_a _= _Ae_− _j_2π_fT _

![](PNMPFull.files/image376.png)

where A is the amplitude of the echo, f is carrier frequency (MHz) and T is
the delay of the echo (μsec). However, the equations are easier to present by
simply using ‘a’.

So its solution, meaning the inverse distortion that has to be applied for
upstream path distortion compensation, can be computed as:

![](PNMPFull.files/image378.png)

which shows that an infinitely recursive echo can be canceled by a single
recursion. So you should be able to cancel a multiple recursion echo with an
adaptive equalizer with only two taps - one for the main signal and one for
the echo. To be precise, this example applies to an ideal case where the echo
delay T equals a multiple of the symbol period, which for a 5.12 Msym/sec
DOCSIS upstream symbol rate is Ts = 195 ns. So, the pre-equalizer can exactly
cancel the echo with a single tap if the single echo has delay T = 195 ns, 390
ns, or 585 ns, etc. If the echo lies between these multiples, the equalizer
will activate additional taps to provide interpolation. In that case it will
be more difficult to see the pattern of a single main recursion.

A single recursion echo can be modeled by 1 + a where 1.0 is the main signal
amplitude and ‘a’ is the echo’s amplitude in linear terms.

The equalizer solution is for a single recursion echo is:

![](PNMPFull.files/image380.png)

So the result is what was expected....infinitely recursive. The first term ‘1’
represents the main tap of the equalizer. The second term ‘-a’ acts to cancel
the echo by subtracting it. However, in doing so, it causes another, smaller
echo in the response. This smaller echo requires the third term to cancel it.
This produces another, yet smaller echo, which requires the fourth term to
cancel it, and so on until reaching the end of the equalizer delay line. After
that, any remaining echo energy (hopefully very small) is not canceled, and
shows up as reduced RxMER (received modulation error ratio), essentially a
noise floor, in the receiver.

If ‘a’ is a relatively big number such as 0.707 (-3 dBc), and the delay T of
the echo is several symbol periods, the taps might run out in the pre-
equalizer before getting an accurate solution. DOCSIS 2.0 and later pre-
equalizers have 24 taps, with 7 taps normally assigned ahead of the main tap,
leaving 16 taps to cancel the echo. For a small value of ‘a’ such as 0.1 (-20
dBc), with a short echo delay, 16 taps are normally sufficient to cancel the
echo with minimal residual energy.

Note that the recursions in the previous equation have alternating signs. To
check for this effect, examine the real and imaginary parts of the equalizer
taps. If the response is alternating in sign, it is a hint that this type of
solution may be present.

![](PNMPFull.files/image382.png)

**_Figure V-5 - Comparison of Signal Path Impulse Responses and Programming for Adaptive Equalizers _**

Figure V-5 summarizes both types of echoes and the resulting programming that
could be found in the adaptive equalizer to cancel the echoes.

**V .5.4 Conclusion **

The upstream cable plant can have two distinctly different types of echoes,
but if the echoes are relatively weak, the differences may not be significant.
If the echoes are strong, the differences can be exploited to help a cable
technician diagnose and fix the cause of the strong echo.

**Appendix VI DOCSIS Pre-equalizer Coefficients Analysis - Software Sequence Diagrams **

**VI.1 Software Sequence Diagram SD-PNM200 **

![](PNMPFull.files/image384.png)

**_Figure VI-1 - Software Sequence Diagram SD-PNM200 _**

**VI.2 Software Sequence Diagram SD-PNM201 **

![](PNMPFull.files/image386.png)

**_Figure VI-2 - Software Sequence Diagram SD-PNM201 _**

**Appendix VII CableLabs Echo Tunnel Simulator Software ****VII.1 Training Tools (Echo Tunnel Simulator **

The echo tunnel simulator Java software is a training tool to help engineers
and technicians develop a quantitative understanding of the complex
mathematics associated with a damaged transmission line. This software is
available for CableLabs members free of charge. See the diagram of Figure
VII-1, which shows an upstream stretch of coaxial feeder with two damage
points, denoted Γ1 and Γ2, which cause reflections. (Γ is the Greek letter
gamma, the symbol normally used by transmission line engineers to denote
complex reflection coefficient.) Upstream direction is to the left. When a
signal hits Γ2 some RF energy will pass through and some percentage will be
reflected backwards to the right. The reflected energy going to the right will
travel to Γ1 and again some percentage will be reflected backward so it is
again going in the original direction. This process occurs infinitely, and can
be observed until the reflected signals drop below background noise. By
knowing the time delay T, and the cable’s velocity of propagation, the LENGTH
can be computed. This space between Γ1 and Γ2 is called an echo tunnel. A
technician doesn’t really know where on the upstream path the echo tunnel is
located, but he can know both the severity and LENGTH of the tunnel. Note that
both Γ1 and Γ2 are represented as sets of complex numbers, with both a
magnitude and a phase angle. Observe that this situation is somewhat analogous
to a person standing in a canyon and shouting “hello” and then hearing “hello”
repeated over and over, each time with less volume. The two walls of the
canyon also form an echo tunnel.

This software was designed to approximately describe cable upstream plant,
which typically operates in North America between 5 and 42 MHz. With DOCSIS
upstream carriers, a common upstream bandwidth is 6.4 MHz wide, and typically
located anywhere between 5 and 42 MHz. DOCSIS upstream uses pre- equalization
(also called predistortion) correction, where a transmission is pre-equalized
or pre-distorted with linear distortion so that the signal arrives in the hub
or headend unimpaired. This situation is not unlike a person using eyeglasses
to pre-distort an image so that the image arrives on his or her retina in
sharp focus. By reading the prescription for the eyeglasses, an eye doctor can
tell what the eye impairment is. Likewise, by reading the pre-equalization
coefficients out of the CM, one can know details about linear distortion,
which might also include group delay, tilt, as well as a possible echo tunnel.

Figure VII-2 is a screen shot of the simulator software. It consists of 5
graphs, and controls on the right side, denoted A, B, and C. Section A
controls the magnitude and phase angles of both reflections, Γ1 and Γ2.
Section B controls the LENGTH of the transmission line and its loss, and
Section C controls the RF center frequency of a 6.4 MHz test bandwidth.

The presence of an echo (delayed signal) will cause a ripple in the frequency
response. This is illustrated in graphs 1, 2, and 3, which are plots of
frequency response magnitude vs. frequency. Magnitude is shown for a 0-50 MHz
full band in graph 1\. However, the CM is only using a 6.4 MHz portion of the
full band, and this portion is shown in graph 2. Note that area C in the
figure is used to modify the center frequency. Graph 3 is simply an expansion
of the 6.4 MHz band illustrated in graph 2.

The frequency difference between the peaks of the ripples indicates time delay
associated with the echo.

Graph 4 is a time plot showing a main signal and an echo. If reflections Γ1
and Γ2 are made more reflective, the echo will get larger. If the LENGTH is
made larger, the time delay of the echo will increase. The log scale button
will convert the linear vertical scale of graph 4 into a log scale.

Graph 5 is a bit more interesting (and complicated). Keep in mind the
frequency response has both a magnitude and a phase. Graphs 1-3 only display
the magnitude portion. Graph 5 shows both the magnitude and phase as the
frequency is changed over the 6.4 MHz band. The magnitude is a distance from
the origin (0,0) to any point on the plot. The phase is the angle (in radians)
of a line drawn from the origin (0,0) to any point on the plot. Observe that
the echo makes a circle on the plot, and the bigger the reflections, the
bigger the diameter of the circle. Likewise, the greater the LENGTH, the
faster the circle rotates as the frequency is changed. (An alternate way of
conveying phase information would be a phase vs. frequency plot, which could
be also be placed on graph 3, using a different color and vertical scale.)

The software’s invert button inverts the frequency response. So if the
magnitude went up at some frequency, when inverted it will go down. This
illustrates how the CM would be programmed vs. frequency.

**Suggested experiments: **

One of the interesting conditions that happen in the field is the case of a
single reflection that sends a signal backwards. But the back reflection is
never seen at the end (CM for downstream or CMTS for upstream). This could
happen if there were only one impedance mismatch, but the launch amplifier had
good output return loss and absorbed the reflected energy.

Make Γ1 =0.8 and Γ2 = 0, and watch the ripples go away. This effectively opens
up one end of the echo tunnel and makes the ripple go away. However, note on
graph 2 that the peak amplitude is not 1.0 anymore, it has dropped due to a
large percentage of the signal being reflected. This really happens in cable
plant can be a cause for low signal levels.

Change cable type to a lossy type and watch the effect on graph 1. Cable loss
dampens the reflections.

Decrease the LENGTH until there a just a few ripples on graph 1. Now note on
graph 2 one can’t really observe ripples, but maybe just a tilt or a flat
attenuation, depending on center frequency. This short length could indicate
that an echo tunnel is inside a home.

![](PNMPFull.files/image388.png)

**_Figure VII-1 - An Upstream Feeder Leg With a Pair of Damage Points Separated by a LENGTH. The Reflection Points Form an Echo Tunnel _**

![](PNMPFull.files/image390.png)

**_Figure VII-2 - A Screen Shot of the Software Showing Graphs 1-5 and Controls on the Right _**

**Appendix VIII CableLabs Time Domain Reflectometer (TDR) ****VIII.1 CableLabs TDR (Time Domain Reflectometer)****18 **

As cable plant ages, plant damages like corrosion, animal chews, or stress
fractures can cause impedance mismatches, which degrade signal quality. If
there are two impedance mismatches, an echo tunnel will be formed that can be
observed in a hub site for upstream signals, or at a cable modem for
downstream signals. However, if there is just one reflection, it gets
reabsorbed and cannot be observed at either end, although signals are
degraded. See Figure VIII-1. However, if a high impedance probe is connected
to the center conductor of the coax, ripples in the downstream digital
frequency response can reveal a problem. CableLabs has shown how a downstream
signal with standing waves can be captured with a software defined radio
(SDR), followed by signal processing to form a TDR. This TDR, because of its
passive nature, is nonservice disrupting, and because of the wide bandwidth
capture, makes extremely accurate distance measurements.

CableLabs uses an inverse Fourier transform to convert the magnitude frequency
response (Figure VIII-2) into a time response (Figure VIII-3). They use a math
trick, putting in (falsely) zero degrees for phase value, allowing the inverse
transform to be performed.

The utility of the idea is enhanced by many sources of magnitude data,
including Full Band Capture cable modem chips, analog spectrum analyzers, SDRs
(Figure VIII-4), field meters that are already deployed, and even random noise
generators.

![](PNMPFull.files/image392.png)

**_Figure VIII-1 - Diagram Showing Detection of a Single Reflection _**

![](PNMPFull.files/image394.png)

**_Figure VIII-2 - A Digital Cable Signal that was Captured by Rapidly Retuning an SDR. The Standing Wave Indicates a Reflected Signal is Present _**

![](PNMPFull.files/image396.png)

**_Figure VIII-3 - A Processed Signal Showing the Single Reflection, Plus Harmonics Caused by Roll-Off of the 6 MHz Haystacks at Band Edges _**

![](PNMPFull.files/image398.png)

**_Figure VIII-4 - A Cablelabs Engineer Making a TDR Measurement in the Field. The SDR is in his Backpack _**

**Appendix IX MIBS **

The CableLabs DOCS-IF3-MIB defines the SNMP calls and responses that will be
used to set the variables of the capture, turn it on, receive and interpret
the data, and then finally turn the capture off. The current version of the
MIB is here: http://mibs.cablelabs.com/MIBs/

To set the parameters of the capture:

EXAMPLE CODE

iii. iv.

**IX.1 **

Creating a spectrum display Exporting spectrum display

1.MIBs, etc.

2.Creating a spectrum display

3.Exporting spectrum display

a. What else?

**Modem Spectrum Analysis MIBS **

Depending on Make/Model/age of modem there may be one of 3 versions of a SA
mib supported by it.

1) DocsIf3

5. 2)  Newer Broadcom, with control objects to allow segment adjustment  

6. 3)  Older Broadcom, with fixed segment width and bin counts  

1 and 2 are functionally equivalent but I would use 1 since it is also
supported by Intel modems. 1 and 2 may coexist on the same modem. 2 and 3 will
not coexist since 2 is a superset of 3. 1 and 3 do not typically coexist on
the same modem

**IX.2 DocsIF3 **

This is all described in great detail in the DOCS-IF3-MIB, but here is an
overview.

**IX.2.1 docsIf3CmSpectrumAnalysisCtrlCmd **

These mibs control the start/stop frequencies, segment width and bin counts

1.3.6.1.4.1.4491.2.1.20.1.34.1 = mib enable

1.3.6.1.4.1.4491.2.1.20.1.34.2 = mib inactivity timeout

1.3.6.1.4.1.4491.2.1.20.1.34.3 = first segment center frequency

1.3.6.1.4.1.4491.2.1.20.1.34.4 = last segment center frequency

1.3.6.1.4.1.4491.2.1.20.1.34.5 = segment frequency span

1.3.6.1.4.1.4491.2.1.20.1.34.6 = number of bins per segment

1.3.6.1.4.1.4491.2.1.20.1.34.7 = equivalent noise bandwidth

1.3.6.1.4.1.4491.2.1.20.1.34.8 = window function (see options below in tree)

1.3.6.1.4.1.4491.2.1.20.1.34.9 = number of averages NOTE: Often only 1 is
supported

![](PNMPFull.files/image400.png)

![](PNMPFull.files/image402.png)

**IX.2.2 docsIf3CmSpectrumAnalysisMeasTable **

This is the table where the actual spectrum data is found.

1.3.6.1.4.1.4491.2.1.20.1.35 = Table

1.3.6.1.4.1.4491.2.1.20.1.35.1 = TableEntry

1.3.6.1.4.1.4491.2.1.20.1.35.1.1 = center frequency

1.3.6.1.4.1.4491.2.1.20.1.35.1.2 = amplitude data (in a hex string)

1.3.6.1.4.1.4491.2.1.20.1.35.1.3 = segment power

+--docsIf3CmSpectrumAnalysisMeasTable(35)

   |

   +--docsIf3CmSpectrumAnalysisMeasEntry(1)

      |  Index: docsIf3CmSpectrumAnalysisMeasFrequency

      |

      +-- ---- Integer32 docsIf3CmSpectrumAnalysisMeasFrequency(1)

      +-- -R-- String    docsIf3CmSpectrumAnalysisMeasAmplitudeData(2)

      |        Textual Convention: AmplitudeData

      |        Size: 0 | 2..4116

      +-- -R-- Integer32 docsIf3CmSpectrumAnalysisMeasTotalSegmentPower(3)

**IX.3 **

**IX.3.1 **

        Textual Convention: TenthdB

**Broadcom Mib ****cmSpectrumAnalysisCtrlCmd **

This is the equivalent of the docsIf3CmSpectrumAnalysisCtrlCmd objects.
However, (unlike the docsIf3

mib) certain versions require the mib to be enabled before the rest of these
objects become settable.

1.3.6.1.4.1.4413.2.2.2.1.2.5.2 = SA mib enable [cmSpectrumAnalysisEnable]

1.3.6.1.4.1.4413.2.2.2.1.2.5.3 = mib timeout (in seconds) 0 will never turn
off

[cmSpectrumAnalysisInactivityTimeout]

**IX.3.2 cmSpectrumAnalysisEnabledCtrlCmd **

These are the rest of the objects mentioned earlier that may require the mib
to be enabled. If the modem has an older version of the Broadcom mib, these
may not exist and default settings must be used.

1.3.6.1.4.1.4413.2.2.2.1.2.5.5 = first segment center frequency

[cmSpectrumAnalysisFirstSegmentCenterFrequency]

1.3.6.1.4.1.4413.2.2.2.1.2.5.6 = last segment center frequency

[cmSpectrumAnalysisLastSegmentCenterFrequency]

1.3.6.1.4.1.4413.2.2.2.1.2.5.7 = segment width
[cmSpectrumAnalysisSegmentFrequencySpan]

1.3.6.1.4.1.4413.2.2.2.1.2.5.8 = number of bins per segment

[cmSpectrumAnalysisBinsPerSegment]

1.3.6.1.4.1.4413.2.2.2.1.2.5.9 = window function (same values as docsIf3 mib)[

cmSpectrumAnalysisWindowFunction]

1.3.6.1.4.1.4413.2.2.2.1.2.5.10 = equivalent noise bandwidth

[cmSpectrumAnalysisEquivalentNoiseBandwidth

**IX.3.3 cmSpectrumAnalysisMeasurementTable **

This is the equivalent of the docsIf3CmSpectrumAnalysisMeasTable

1.3.6.1.4.1.4413.2.2.2.1.2.5.1 = BCSpectrumAnalysisMeasTable

[cmSpectrumAnalysisMeasurementTable]

1.3.6.1.4.1.4413.2.2.2.1.2.5.1.1 = BCSpectrumAnalysisMeasEntry

[cmSpectrumAnalysisMeasurementEntry]

1.3.6.1.4.1.4413.2.2.2.1.2.5.1.1.1 = Index: Center Frequency

[cmSpectrumAnalysisFrequency]

1.3.6.1.4.1.4413.2.2.2.1.2.5.1.1.2 = Spectrum Amplitude Data

[cmSpectrumAnalysisAmplitudeData]

**IX.4 Broadcom **

Broadcom names are unofficial.

Convention is to relate them to the docsIf3 version for which we have a mib.

**IX.4.1 BCSpectrumCtrlCmd **

This is the equivalent of the docsIf3CmSpectrumAnalysisCtrlCmd objects.
However, (unlike the docsIf3 mib) certain versions requires the mib to be
enabled before the rest of these objects become settable.

1.3.6.1.4.1.4413.2.2.2.1.2.5.2 = SA mib enable

1.3.6.1.4.1.4413.2.2.2.1.2.5.3 = mib timeout (in seconds) 0 will never turn
off

**IX.4.2 BCSpectrumEnabledCtrlCmd **

These are the rest of the objects mentioned earlier that may require the mib
to be enabled. If the modem has an older version of the Broadcom mib, these
may not be exist and default settings must be used.

1.3.6.1.4.1.4413.2.2.2.1.2.5.5 = first segment center frequency

1.3.6.1.4.1.4413.2.2.2.1.2.5.6 = last segment center frequency

1.3.6.1.4.1.4413.2.2.2.1.2.5.7 = segment width

1.3.6.1.4.1.4413.2.2.2.1.2.5.8 = number of bins per segment

1.3.6.1.4.1.4413.2.2.2.1.2.5.9 = window function (same values as docsIf3 mib)

1.3.6.1.4.1.4413.2.2.2.1.2.5.10 = equivalent noise bandwidth

**IX.4.3 BCSpectrumAnalysisMeasTable **

This is the equivalent of the docsIf3CmSpectrumAnalysisMeasTable

1.3.6.1.4.1.4413.2.2.2.1.2.5.1 = BCSpectrumAnalysisMeasTable

1.3.6.1.4.1.4413.2.2.2.1.2.5.1.1 = BCSpectrumAnalysisMeasEntry

1.3.6.1.4.1.4413.2.2.2.1.2.5.1.1.1 = Index: Center Frequency

1.3.6.1.4.1.4413.2.2.2.1.2.5.1.1.2 = Spectrum Amplitude Data Software Example
Programs

**Appendix X ****PNM Tools Catalog **

These are tools that are free and available to CableLabs members.

**_Table X-1 - PNM Tools Catalog _**

![](PNMPFull.files/image404.png)



**Appendix XI Acknowledgements **

On behalf of the cable industry and our member and vendor companies, CableLabs
would like to thank the numerous individuals who contributed to the
development of this document. In particular, we want to extend our sincere
appreciation and gratitude to the following Proactive Network Maintenance
Working Group members.

**Contributor **

Alexander Adams

Ayham Al-Banna, Rohini Telukutla

Thomas Clack, Bruce Currivan, Roger Fish

Ken Martin

Robert Cruickshank

Alberto Campos, Eduardo Cardona, Kevin Kershaw, Bill Kostka, Dustin Tracy,
Ryan Vail, Tom Williams

Todd J. Gingrass Ron Hranac Pradeep Anand, Will Berger, Kirk Erichsen Phillip
Chang, Robert Gonsalves, Spondon Hazarika, Larry Wolcott Jeff Finkelstein,
Mark Geiger, Christopher Reyes, Jason Sailor, Huy Tran John Moran Patricio
Latini Walter Miller Charles Moore, Jack Moran, Robert Thompson James Medlock
Jim Liu, Michael Truong David Hunter Niem Dang, Daniel Howard, Dean Stoneback
Steve Saunders Jerry Green Rob Richards Antonio Bonici, Alex Garcia Brady
Volpe Scott Helms

**Company Affiliation **

Adams Consulting Arris International Broadcom Corporation Buckeye CableSystem
Cablevision

Cable Television Laboratories, Inc.

CCI Systems Cisco Systems Charter Communications Comcast Cable. Cox
Communications Huawei Intraway JDSU Motorola, Inc. Ponderosa Systems Rogers
Scrub Jay Communications SCTE Sentosa Technologies Sunrise Telecom VeEX, Inc.
Videotron The Volpe Firm Zcorum

We would particularly like to thank Robert Thompson of Motorola and Ron Hranac
of Cisco for their commitment and leadership as the Proactive Network
Maintenance Working Group editors; Alberto Campos of CableLabs for all his
efforts as Working Group Lead; Eduardo Cardona of CableLabs for leading the
reference implementation development effort; and all other participants who
provided input to the working group.

Our sincere appreciation goes to operator members who supported this effort
providing feedback and facilitating field data; in particular Nick Segura from
Charter, Chris Nelson from Time Warner Cable, Wil Colon from Comcast, Joe
Jensen from Buckeye, Mike Giobbi from Armstrong, Bob Cruickshank from
Cablevision and George Hart from Rogers. Special thanks to Todd Szuter and
Scott Johnston from Comcast for field verification of impairment scenarios and
to Anupama Purohit from CableLabs for laboratory verification of micro-
reflection and group delay scenarios.

