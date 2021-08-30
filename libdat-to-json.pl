use strict;

$/ = /\n\n+/;

=pod 

The goal structure:
[
    {
        "text": "The Argushiigi Admegulasha Bilanidin, which in Vilani literally means the \"Vilani Repository of All Knowledge\", is a major scientific institution on Vland. The extensive AAB facilities include a vast museum, a library, and several research centers and publishing houses. Not only does AAB collect samples, specimens, and recorded materials from all over explored space , but it also publishes an abridged 15 holocrystal encyclopedia set of its extensive data files. Known simply as \"The Encyclopedia\", the set contains the equivalent of 7500 extensively illustrated volumes, yet it can easily fit into a large pocket.",
        "title": "AAB",
        "tags": "",
        "modified": "20190831230456348",
        "created": "20190831230407109"
    },
    {
        "text": "Wonder why it didn't work?",
        "title": "BAA2",
        "tags": "",
        "modified": "20190831230908406",
        "created": "20190831230853187"
    }
]

=cut

my @libdat = ();

#print "<dl>";
for my $entry (<DATA>)
{
   my ($subj, @rest) = split /\n/, $entry;
   chomp $subj;
   
   my $rest = join "\n", map { "<p>$_</p>" } @rest;
   my $text = join "\n\n", @rest;
   if ($text =~ /See (also )?(.+?)\./)
   {
      my $also = $2;
      my @also = split /,\s*/, $also;
      $also = join ', ', map { "[[$_]]" } @also;
      $text =~ s/See also (.+)$/See also $also./g;
   }
   my $tags = '';
   if ($text =~ /Tags: (.+?)\.?$/)
   {
      my @tags = split /\s+/, $1;
      $tags = join ' ', map { ucfirst $_ } @tags;
      $text =~ s/Tags: .*$//;
   }

   my ($sec, $min, $hr, $day, $mon, $yr) = localtime;
   $yr += 1900;
   $mon++;

   my $stamp = sprintf( "$yr%02d%02d%02d%02d%02d000", $mon, $day, $hr, $min, $sec );
   push @libdat, 
   {
      'text'     => $text,
      'title'    => $subj,
      'tags'     => $tags,
      'modified' => $stamp,
      'created'  => $stamp
   } if $text && $subj;
   
#   print<<EOENTRY;
#<dt>$subj</dt>
#<dd>$rest</dd>   
#EOENTRY
}
#print "</dl>";

use JSON::Tiny qw(encode_json);
open OUT, '>', "libdat.json";
print OUT encode_json \@libdat;
close OUT;
no JSON::Tiny;

__DATA__
AAB
The Argushiigi Admegulasha Bilanidin, which in Vilani literally means the "Vilani Repository of All Knowledge", is a major scientific institution on Vland. The extensive AAB facilities include a vast museum, a library, and several research centers and publishing houses. Not only does AAB collect samples, specimens, and recorded materials from all over explored space , but it also publishes an abridged 15 holocrystal encyclopedia set of its extensive data files. Known simply as "The Encyclopedia", the set contains the equivalent of 7500 extensively illustrated volumes, yet it can easily fit into a large pocket.
Tags: general.

Adventure-Class Ships
Also ACS. Generally, starships up to 2400 tons. Specifically, certain starship designs encountered throughout Charted Space:
See also Scout, Free Trader, Far Trader, Safari Ship, Yacht, Armed Packet, Gazelle Class Close Escort, Subsidized Merchant, Lab Ship, Patrol Corvette, Subsidized Liner, Mercenary Cruiser.

Adair
Archduke of Sol, Grand Admiral of the Rim. Adair's great grandmother held the post of Grand Admiral of the Rim during the Solomani Rim War, and was rewarded with the Archduchy. 

Addaxur
Intelligent race of six-legged carnivores from a high gravity world 40 parsecs from Zhdant (subsector G of Tienspevnekr). By -5,120 they had established an empire of 37 worlds connected by sublight ships. Contacted by Zhodani in -5100. Ten worlds were reserved for them.
Tags: sophont.

Ael Yael: Minor race native to Jaeyelya (Gushemege 0437).

Akerut
Wholly owned subsidiary of Tukera Lines, organized to establish trade routes and shipping stations within the Aramis subsector of the Spinward Marches.  Akerut gains most of its revenue from cargo transport and trade within the subsector.  Approximately 25% of its shipping involves transport of cargos to or from locations outside the subsector.
Tags: company.

Algine (Regina 0708 X766977-4) Red Zone
Interdicted by the Scout Service in order to protect its developing technological culture.

Al Morai
A sector-wide merchant line based on Mora. Al Morai maintains interstellar service to the capitals of Imperial subsectors in the Spinward Marches, and to Imperial worlds along the trade routes which connect them. Established in 120 as a local transport company serving systems within ten parsecs of Mora, the company soon expanded to handle freight and passengers travelling from Darrian and the Sword Worlds to the Imperium. During the widespread explorations of the Marches in the Third Century (201 to 300), Al Morai established an Exploration Division to supplement its cargo carriers. That division discovered, claimed, and developed two worlds: Windsor (1935) and Shirene (2125). Windsor was later sold to Ling Standard Products; Shirene was retained as a base of operations and a source of merchant goods. 
Service outside the Imperium (to Darrian and the Sword Worlds) was discontinued when the First Frontier War began (589) and has never been resumed.
Scheduled Service: Al Morai's 53 ships should mean that with perfect traffic, each world would be visited by a new ship once every week. As a practical matter, the convolutions of the Al Morai route system make ship visits somewhat less frequent -- one ship visits each world once per four weeks (with a 50% chance that it is going in a specific direction). With the exception of Carey and Roup, Al Morai serves only class A and B starports, and facilities are maintained only at such starports. 
Al Morai has three operating divisions: the Transport Division, the Markets Division, and the Exploration Division.
The Transport Division operates Al Morai's fleet of 53 cargo carriers, providing both passenger and freight service. The Markets Division maintains Al Morai's starport facilities along its routes. In addition to providing ticket facilities and freight terminals, it operates as a merchant, buying local goods for export and importing needed materials for sale.
The Exploration Division originally surveyed star systems, but as new star systems became unavailable, its purpose shifted to surface exploration of Shirene. The Exploration Division currently operates a large geological survey team, with prospecting detachments throughout Shirene. 
Tags: company.

Amber Zone
Traveller's Aid Society classification for a nation, world or system which presents a need for caution in dealings and activities. The amber zone may indicate chaos, upheaval, or xenophobia in local business, politics, society, or culture, or may be applied for other reasons. Travellers should exercise caution. 
See also Red Zone, Travel Zone.
Tags: general.

Anagathics
TL15+ drugs that slow or stop aging.

Ancients
Highly intelligent race which gained prominence approximately 300,000 years ago.
Most of what is known about the Ancients has been gleaned from archeological excavations of Ancient sites: the remains of cities, bases, outposts, and settlements of the Ancients. Scientific dating techniques have established that a “Final War” spanning a 2000-year period destroyed virtually all of the Ancients at that time.
The influence of the Ancients is broadly felt in the universe. Humans from Terra were transported to many worlds by the Ancients; their descendants became the Vilani and the Zhodani, as well as the 46 known minor human races. The Vargr have been shown (through genetic testing) to be descendants of genetically manipulated Terran canines (apparently, the canine stock was acquired at the same time the humans were taken from Terra). Ancient artifacts which have been discovered show a very high tech level and an equally high degree of sophistication, such artifacts often reveal new, previously undiscovered or unexploited technologies.
The Ancients were responsible for several major features within the region now occupied by the Imperium. Their warfare resulted in the large proportion of asteroid belts throughout explored space. There is evidence they created the multiworld rosette at Tireen (Knaeleng 2910, in the Vargr extents). Scattered empty cities (most severely damaged by battle) stand as evidence of their wars; most, however, are restricted areas under investigation by the Imperium and not open to the public. One notable exception is the world Antiquity (Corridor 0816). The Antiquity Ancients site is open to tourists; its fascinating museum displays many wondrous and mystifying artifacts, many of which are still in working condition.
See also Antiquity, Humaniti, Solomani Hypothesis, Vargr.
Tags: history.

Andory (Spinward Marches 0236 C695735-9)
Prime candidate for the Droyne homeworld. Discovered in 802 and placed under interdiction by Imperial Interstellar Scout Service. 
See also Droyne.

Anglic
The official language of the Third Imperium. A distant descendent of Terran English, Anglic was the language of the Rule of Man (-2294 to -1776). Anglic remained a common interstellar language for trade and commerce during the Long Night. Its widespread use on the original worlds of the Third Imperium made it the natural language when the Imperium was established.
On many worlds, Anglic is only a second language used for system traffic control, commercial operations, and interstellar communications. Anglic is often called Galanglic (for Galactic Anglic). 
The Imperium has not been able to prevent the emergence of a wide variety of Anglic dialects. Interstellar communications, holocrystals, and recordings help to spread a uniform pronunciation of Anglic throughout the entire Imperium. Within the Imperium, any Anglic speaker can understand almost any other, but isolated communities on worlds with little contact with interstellar trade lanes shift their speech patterns to form dialects. In addition, broad areas within the Imperium have established their own pronunciation patterns; accepted dialects include Rim (which includes Terra), Core (the central region of the Imperium), Riftian (the spinward frontiers), and Transform (the Antares region).
Tags: language.

Answerin
Minor human race native to Answerin/Parsi (Vland 0431).

Antares
Trailing region of the Imperium. The name is applied to a variety of places at the trailing fringe of the Imperium.
Antares is a domain of the Imperium, a sector within that domain, and capital of that sector.

Antares, League of
An autonomous region within the Imperium. The worlds were originally pressed into the Imperium in 89 during the Antarean Pacification Campaign. The worlds were occupied by the Julian Protectorate during the Julian War. When regained for the Imperium at the end of the war, the peace terms included a mandate that the League of Antares be given limited autonomy for control of trade, commerce, and internal affairs.
The autonomy of the League served as a model for the later establishment of the Solomani Autonomous Region.

Anti-anagathics
Drugs that allow aging to be accelerated. Available at tech level 15.

Ansing Expedition
Famous exploration of the accessible reaches of the gas giant Annikkittar in the Pretoria system in 870 to 884. Extensive use of specially designed exploration vessels, protective suits, and high technology equipment allowed the Ansing Foundation of Vland to extensively map and explore the upper reaches of the gas giant's atmosphere.
Tags: history.

Antebellum
Literally, before the war. General historical term referring to the period within the Imperium before the Civil War, specifically 210 to 604.
The Antebellum period was characterized by expansion of the Imperium with large scale colonization efforts, integration of numerous regions into Imperial society, and an overall mood of growth and exploration. With the end of the Antebellum period, the Imperium turned more attention inward and devoted resources to internal development and consolidation.
Tags: history.

Antiquity
(Corridor 0816 A223420-C)
One of the best preserved Ancient sites in existence. Discovered in 385, the site is unique in that many parts of it are still operational. The biggest problem faced by researchers has been figuring out what things did, and how they worked. Many items are still a mystery. See also Ancients.

Aositaoh Class Transport
QSP T-KL33. Aslan starship. Using a 1000-ton hull, the Aositaoh is built for small-scale clan troop transport and combat operations. It is equipped with the Taiwiue Systems Q12-3q jump drive, the KHAO Model Q.39 maneuver drive, and the Grid 3e Uaiy/Q7 power plant, and is capable of Jump-3 and 3G acceleration. Fuel tankage supports 4 weeks of operations and one jump-3. On the bridge is a computer Model/5.
There are 55 staterooms, one gunner's barracks, two platoon barracks, and no low berths. The ship has ten triple turrets: six triple beam lasers, three triple missile racks, and one triple sandcaster. The ship carries a launch, two pinnaces, four ATVs, and four airlrafts. Cargo capacity is 88 tons. The hull is streamlined.
The cruiser requires a crew of 14: captain/pilot, astrogator, five engineers, sensor tech, four gunners, a medic, and a purser (or the female executive officer). Up to 96 people can be carried with double occupancy; usually including 80 troops (2 platoons) and berths for small craft pilots, clerks, or others as needed.
Tags: Starships.

Arean Transport
Transport division of the Makhidkarun megacorporation.
See also Makhidkarun.
Tags: company.

Arkesh Spacers
A frankly predatory outfit on the thin line between accepted commercial practice and outright piracy. With a nominal headquarters on Strouden/Lunion (0707), Arkesh Spacers eschew regular bases, instead relying on (often criminal) contacts on many Marcher worlds to provide custom and maintain their vessels. Attracted to anything with a profit in it.
Tags: company.

Armed Packet
QSP UF-CA33. Using an airframed 300-ton hull, the Iishillek-class Packet specializes in unscheduled passenger service for those in a hurry. It is equipped with the Madoc Mark 3 jump drive, the ISMM Model D.34 maneuver drive, and the Deltic Mk3323-D power plant, giving performance of Jump-3 and 3G acceleration. Adjacent to the bridge is a computer Model/3. The ship is armed with two triple missile launcher turrets and one triple beam laser turret. It has one ship's vehicle: an air/raft. The ship can gather and purify fuel from gas giants, seas, and ice.
The ship requires a crew of 5: Pilot, Astrogator, two Engineers, and a Medic. Up to three gunners and two additional troops can bunk in the gunners' barracks. It can carry up to 12 middle or high passengers and 5 low. Cargo capacity is 4 tons. 
The crew can be trusted, but these little ships still find themselves jumping in harm’s way.
Tags: Starships.

Arrow, Honorable Order of
Imperial order of knighthood established to recognize interstellar explorers.

Artifacts and Ancient Sites
The debris which remains from the Ancient's civilization is scattered about across parsecs of space. When a piece of that civilization is found, it has value to anyone trying to piece together the answer to the puzzle of the Ancients. 
ARTIFACTS 
The individual pieces are artifacts; manufactured items which were used by the Ancients in some aspect of their civilization. Artifact is the commonly applied term. Artifacts come in all types and sizes. The vast majority are garbage; some broken devices which tantalizingly promise higher technology; a very few artifacts are working devices which can be used and sometimes even understood.
The garbage artifacts are the ones most people find. They are strewn about Ancient sites destroyed in their cataclysmic Final War; they are rubble. But even this rubble is fascinating! Shimmering pieces of broken brick; pearlescent plates of transparent glass-hard as diamond, but melting castable; simple metal containers-except the metal is titanium! or sometimes cobalt.
Broken devices are rarer by a factor of a thousand. Excavations of Ancient sites occasionally stumble onto relatively complete devices.
Rarer than broken devices are working devices. Very occasionally, one of the broken devices isn't: it works. Often the challenge to the excavators and the re- searchers is to determine not how it works, but what it does. 
The havoc produced by the Final War destroyed every settlement, every ship, every structure the Ancients built. No one has ever found an Ancient ship or city which has survived. Partly for this reason, some have theorized that the Ancients abandoned this area of space, leaving (fleeing, migrating, wandering, exploring) for a new territory, and destroying all that was left behind. 
The ultimate find then, the once-in-a-lifetime discovery, is an untouched Ancient vessel or city. 
Traffic in Ancient Artifacts: The Imperium has an extreme interest in artifacts; its researches into the technology they represent is considerably enhanced by an analysis of every available artifact. 
In order to analyze every artifact, the Imperium has strict laws controlling traffic in artifacts. Artifacts cannot be legally sold unless registered with the Imperium. The process of registration allows the Imperial authorities t o analyze each item; rubble is registered and allowed, while more interesting items are confiscated and kept for deeper analysis. 
As a result, there is an illicit traffic in artifacts. Any artifact besides a piece of rubble can usually be sold for more money in the illegal market than it can to the Imperium. 
IMPERIAL INTEREST 
The Imperium has always taken a deep interest in Ancient artifacts.
Imperial Research: Ancient sites within the lrnperium fall under the domain of the Imperial Interstellar Scout Service. Under the control of the scouts, these sites are excavated and researched under carefully controlled conditions. 
After an initial evaluation, occasional sites (those which seem otherwise in- nocuous) are made available t o the academic community. Much of what is known about the Ancients has come from research at these sites. Major universities compete for an opportunity to research an Ancient site. 
Within the Regina subsector, two known Ancient sites are researched under the auspices of the University of Regina. 
Discovery Bonuses: The Imperium has long searched for Ancient sites, but it has never been able t o find them all. Aware of this, the Imperium has established a series of incentive bonuses designed to encourage the reporting of newly located Ancient sites to the authorities. 
A payment of Cr50,000 is made for reporting a previously unknown Ancient site to the authorities. 
A subsequent bonus of between Cr100 and Cr1,000,000 is made depending on an analysis of the site in depth. 
KNOWN SITES 
Within the Regina subsector, there are six known Ancient sites. 
University of Regina: Two of the earliest Ancient sites discovered in the subsector are now excavated and researched by scholars from the University of Regina. A small site on Yori was originally found buried under drifting sands in a vast desert surrounded by signs of destruction from the Final War. The site itself is characterized by iridescent white building blocks and occasional deep rubble-filled wells.
A somewhat larger site on Beck's World is a collapsed warren of interlocking caverns only partially excavated.
Imperial Sites: The Imperial Scout Service administers three sites in the subsector, but only one is publicly acknowledged.
The admitted site is located on Efate. Discovered in 354, it has long since been stripped of any useful items, and is now operated as an historic site. Restorations of the site show a gridwork of thousands of walls spaced about two meters apart and punctuated by extremely massive bulwarks at random intervals. 
The site on Pixie is located on the edge of a vacuum plain under the shadow of a range of mountains. It is a flat irregular area meticulously inlaid with a mosaic of multi-colored anodized aluminum bars. There is no sign of the purpose of this site. This site is not public, and is protected by numerous security devices. 
The Scout Service also administers a site on Inthe. Large artificial mounds of earth, tens of kilometers in length, are scattered over a thousand square kilometers, but analysis and excavation has given no clue as t o their purpose. A large volcanic crater (now water filled) lies on the plain in the center of the mounds and may have been the site of the Ancient base. 
Naval Site: The Imperial Navy administers a site on Knorbes. Elaborate precautions have been taken to conceal the fact that a site even exists, while similarly elaborate security measures trap and detain intruders. 
The Navy has made this site a major excavation project; the Ancient base was originally destroyed when a massive attack cratered the area and then toppled mountains into the craters. In the thousands of years since, erosion has uncovered the ruined brick and mortar buildings of the site. Of especial interest is the large cache of black globe force field generators discovered here.

Ashley, Sir Gildemar Tomas
One of the best known of the Solomani faction, though not of the dynasty. Ashley was a prime mover in the abortive civil war now known as the Solomani Rim War (990 to 1002). Once defeat became inevitable, Ashley and others decided to leave the Imperium and settle a suitable planet on the edge of the Outrim. The planet Egyrn was chosen, and is now known as Ashley's Rock through common usage. Ashley's memoirs, Unrepentant Exile, include a detailed account of the colonization of that airless world.
Tags: history.

Ashurgash, Order of
One Imperial order of knighthood for Imperial Army officers. Members commonly served with units drawn from Vilani-cultural worlds.

Aslan
A race of intelligent beings with an established interstellar dominion spinward and rimward of the Imperium; in addition large numbers have settled within the Imperium.
Aslan stand roughly human sized, averaging 2.0 meters in height and weighing about 100 kg. They are descended from four limbed, upright, bipedal carnivore/pouncer stock originally adapted to a solitary arboreal existence.
The earliest Terran explorers saw in them a vague resemblance to the Terran lion, and they have been described (by Imperials) as lion- like ever since, although there is very little true similarity. The derivation of the word Aslan is unknown. There are two sexes, male and female. The most notable difference is the increased size and mane of the former. Females outnumber males by 3 to 1.
Aslan have a highly specialized dewclaw under each thumb which folds back jackknife fashion into a horny covering in the base of the thumb and palm.
A vast Aslan dominated region (the Aslan Hierate) lies far to rimward, but Aslan themselves have ranged well beyond its borders, with many settling within the Imperium and attaining full status as citizens. As such, they subordinate themselves to Imperial authority, although they have remained culturally separated from human society. Aslan serve in the Imperial armed forces; they achieve nobility; they pay taxes; they run businesses. 
See also Aslan Border Wars, Aslan Hierate.

Aslan Society
The Aslan are a warrior race, proud, noble, and devoted to those in authority above them. An individual Aslan is usually a member of a family of from 2 to 12 individuals under a patriarchal leader. Several families will combine into a pride with one dominant family. A number of prides form a clan, with a dominant pride. Aside from military organizations and the ruling council (within the Hierate), the clan is the highest socio-political unit among the Aslan.
A deep-seated territorial instinct causes the Aslan to have an inordinate (from a human standpoint) concern with land. For male Aslan, owning land is a major goal in life. An Aslan's stature is determined by the amount of land he (or her husband) controls, or by the amount of land owned by any higher lord the Aslan may be vassal to. The lowest classes of Aslan are landless, and provide the farmers, laborers, craftsmen, and factory workers. A holder of a large territory will often grant authority over it to vassals (usually sons, brothers, or male relatives by marriage) who administer the land in his name.
The sexes have very different roles in Aslan society. Males (in all but the lower classes) are concerned mostly with military operations, acquisition of territory, and political affairs. Females are concerned with trade, industry, and the accumulation of knowledge. Upper class males have little conception of money and are literally incapable of functioning in a technological society without aid, so they are thus seldom encountered without the supervision of a wife, mother, or other female relative or employer.
For instance, a typical Aslan mercenary unit will be organized by a wealthy married female, who will then assign its operation, for a share of the proceeds, to an unmarried female relative. The battle commander and most of the troops will be unmarried males (many of them also relatives) hired with the promise of land grants (and the opportunity to gain honor and reputation in combat); however, staff, operations, supply, and intelligence officers will generally be female.
The extremely deadly nature of any combat between Aslan has led to a rigid, ritualized pattern of behavior designed to reduce conflict. Aslan are very polite, and while most have learnt to be patient with non-Aslan, accidental fights still occur. Disputes between individuals are handled by the patriarchs; disputes between families are handled by the pride leaders; disputes between prides are handled by clan leaders.

Aslan Calendar
The Aslan calendar is based on the period of Kusyu (the Aslan homeworld) around Tyeyo, its star. The Aslan ftahea (year) is 319.98 standard days in length. 
See also Aslan Border Wars, Aslan Hierate, Kusyu.

Aslan Border Wars
(-1118 to 380)
A series of conflicts between various Aslan clans and human systems as the Aslan expanded toward already settled human territory. The Aslan achieved jump drive late(-1999) and proceeded to expand into available territory in their region of space. Contacts along their trailing border necessarily resulted in friction with the human systems in that region.
Because the Long Night was already well under way by the time the Aslan encountered humans, there was no central human government to resist Aslan attacks. Since there was no united Aslan authority either, the sides were fairly matched, and numerous small wars erupted between Aslan clans and human splinter states, with alliances between the various powers constantly forming and dissolving.
The border between human and Aslan space remained relatively constant, with a few systems changing hands after each war. At this time some clans also launched raids into the interior of the former Imperial domains, where they conquered and settled worlds as much as 40 parsecs beyond the border.
Once the Third Imperium expanded into the region (circa 200), its superior organization and technology gradually put an end to the Aslan threat. The final treaties, known as the Peace of Ftahalr, were negotiated with all the major clans. They established a buffer zone about 30 parsecs wide between the Imperial border and the region of Aslan control. There has been no war since then(380), although the Solomani have violated portions of the zone and incorporated it into their boundaries. 
See also Aslan, Aslan Hierate.
Tags: history.

Aslan Hierate
Interstellar, multisector government of the many Aslan clans. Aslan society centers on the clan. Within the Hierate, the family structure of the Aslan and the governmental structure are the same. The highest governmental functions are performed by a council of twenty-nine clan leaders chosen from amongst the most powerful clans.
"the 29"(as they are known) have a quasi religious status and represent the essential unity of the Aslan race. To be chosen one of the "the 29" is the highest honor to which an Aslan can aspire. The 29 meet continuously on Kuzu to adjudicate interclan disputes and decide matters of group policy. No member of the 29 speaks for the Hierate as a whole, nor does the whole 29.
There are no Hierate armed forces; each clan has its own, and rarely act in concert with those of other clans. The Hierate itself can call upon military forces only in so far as the clans themselves agree to provide such forces. Even the minor forces conveying the 29's decisions are actually under the control of individual clan leaders.
See also Aslan, Aslan Border Wars, Kusyu 
1116: Dulinor the Usurper shot and killed the Aslan ambassador from the Yerlyaruiwo clan at the same time he murdered the late emperor; this sparked Aslan reprisals in the rimward border of Trojan Reach Sector and the Solomani Rim. Officially, however, these scattered border hostilities do not constitute a state of war between the divided Imperium and the Aslan Hierate.

Assassination, Right of
The first Third Imperium emperor to be shot by his successor was Cleon II, also known as Cleon the Mad. Selected by lot in a secret meeting of the High Moot, Porifia shot Cleon II in his council chambers in 245. Porifia was subsequently proclaimed empress by Moot confirmation.
During the Civil War period, several usurpers attempted to claim the throne by the right of assassination-few succeeded. Although the right of assassination has fallen into disuse, it is generally agreed that for the method to be a valid route to the iridium throne, certain precedents must be followed: 1) the assassin must be a high noble: 2) the assassin must kill the emperor by his own hand in the presence of witnesses; 3)the Moot must approve of the new emperor, just as with any successor.
Thus, the reason for the assassination must be well founded, or Moot confirmation will likely be denied. Moot confirmation can make all the difference-depending on what the Moot says, the assassin could be hailed as a courageous hero or prosecuted as a seditious murderer.
1116: The attempt by the usurper Dulinor, Archduke of Ilelish, to claim the throne via Strephon's assassination is not seen by most loyal Imperial citizens as a legitimate claim to the throne. The Moot has not yet had an opportunity to decide on the matter.
Tags: history.

Assault Lander
A heavily armed small craft, usually armed, designed to land combat-equipped troops under fire.

Asteroid belt
A planetoid belt which is the main world of its system.

Astrobleme
A scar left on a planetary surface by the impact of a meteorite. Roughly speaking, a meteorite hitting a planet will make a crater ten times as big as itself.

Astrography
The science of mapping interstellar space. Basic to any science of mapping is a coordinate system. The scientific system used by the Imperium is based on rings of longitude, rays of latitude, and parsecs. By convention, rays of latitude and rings of longitude are measured from a starting point at Reference/Capital, the world where the data from the First and Second Imperial Grand Surveys are stored.
This mapping system is highly Imperio-centric, and other systems are used by other peoples and races outside the Imperium This system has gained wide acceptance, however, among Imperium dominated client-states, human and otherwise. This mapping system breaks down and is prone to error beyond certain limits. It does serve admirably for a band approximately 400 parsecs wide at a longitude of 10,000 parsecs, which is a region precisely centered on the Imperium.
In ordinary discourse, a world is referred to by its name, sector, and subsector. For example, the homeworld of Archduke Norris is Regina (Spinward Marches/Regina): that is, the world Regina in Regina Subsector in Spinward Marches Sector.
Tags: astrography.

Atrake
Fruity wine produced on Zila from trakes. Atrake enjoys a reputation within the Marches as a quality wine, largely due to extensive marketing by Tukera Lines.

Au'alrealko
Ancient Aslan philosopher who formulated the concepts of honor as they are known today among most Aslan. So important was this achievement that her name is written with the 'ko' particle usually reserved for clan heads. This remarkable token of respect indicates that all Aslan, in one sense, could be considered her clansmen and descendants, since they follow her teachings.

Baraccai Technum
Though the Imperial core may be decaying and to some extent introspective, in the Spinward Marches at least, the trading spirit still burns fiercely. Large multi-system cartels continue the ages-old Terran tradition of cut-throat trade rivalry for materials and their markets in and beyond the Imperium. One such cartel is the Baraccai Technum (BT). 
With its headquarters on Trin'sVeil (0805), BT is influencial throughout the rimward worlds of the Marches; its wealth rests firmly on manufacturing, transport and brokerage interests. However, by no means unimportant are entre- preneurial connections with worlds beyond the Imperium in the Outrim Void, an interspiral region immediately to rimward of the Marches. This aspect of BT operations is our present concern, specifically those in the Pax Rulin subsector. 
THE EIA DIVISION, GLISTEN 
The BT Centre on Glisten/Glisten (0406), hub of BT operations at the splnward end of their territory, is responsible for the EIA (Extra-Imperium Activity) Division. Primary base for operations of this Division is their orbital base at Berengaria/Pax Rulin (0505), and it is here that the merchant cruiser Leviathan is being prepared for its next mission, tethered to an orbiting BT maintenance and repair station. The Division has similar bases elsewhere in the subsector at Cyan (0502). Pax Rulin (0604). and Alexin (0805). All of the Imperial worlds in the subsector, except Rhysk (0704), have some sort of BT trading presence. The normal method of maintaining trade relations with independent worlds is the appointment of a Factor, usually a BT company man, but occasionally a native of the planet. Apart from the usual warehousing, living quarters, office and so on, each Factor also. has a small emergency ship repair facility for the use of BT vessels. BT have factors on Candia (0201), Kydde (0210), Bantral (0306), Senlis (0508), Magen (0709), and T'yana/Egyrn (0802). 
The chief officials of BT's EIA Division are the Division Vice-President, Dom Guerau de Seripando (age 54, 755AAB); the Fleet Captain, Gaspard Moy (age 50, 596A99); and the Chief Factor, William of Hotzel (age 42, A36B89), 
Style and Opposition
Apart from the dangers to be expected in any unexplored region of space, active or passive opposition to BT operations comes from two quarters: commercial and official. Partly due to this opposition, BT has developed a measure of efficiency in dealing with those who talk loosely about their operations.
Operations
Designed jointly by Bilstein Yards of Glisten and the Baraccai Technum, the Leviathan-class Merchant Cruiser was developed from previous designs and is primarily intended for independent cruising in undeveloped trade areas; high survivability is also a design factor. BT owns and operates three of them: the Leviathan (MC-50164), the Decameron (MC-50165), and the Roman de la Rose (MC-54503), with one more on order (to be laid down 003-1107). The Mar de Damas (MC-52861) was destroyed off Zaibon in the Lunion subsector 022-1098; mistaken by an Imperial Kokirrak class dreadnought for the Marcucci due to a communications malfunction. Only 15 crew survived. 
Tags: company interface-line.

Baronet
A special form of baron awarded by an Archduke. Baronets rank below barons in seniority and precedence.

Barracks Emperors
Collective term describing the succession of emperors springing from military backgrounds(and usually seizing the throne by force) during the Civil War. 
See also Emperors of the Flag.
Tags: history.

Battle dress
A somewhat bulky, man-sized cross between a spacesuit and plate armor. Some built-in equipment increases its bulk. For example, a life support/power unit is integrated into the suit back. No weapons are integral, but a visible computer socket/link is placed on the chest front at the right and left shoulders where a rifle would normally be placed.

Battle of Two Suns
(1084)
The final battle between Imperial forces and the barbarians in the Fourth Frontier War. Losses on both sides were heavy, but the Imperium held the field and the barbarians were unable to continue their advance due to their lengtheningsupply lines. Had the battle gone the other way, the loss of both Yres and Menorb (the encounter ocurring midway between those two locations) would have forced the evacuation of Efate and meant the collapse of the entire coreward end of the Regina subsector.
The battlefield is still posted as a dangerous area, littered with debris, and avoided by interstellar transportation.
Tags: history.

Battle Rider
 Non-jump-capable capital ship intended to stand in the line of battle in space combat and carried by a battle tender. A battle-rider is a non-jump-capable capital ship generally carried on a large (up to one million tons) fleet tender. Such a tender carries a complete Battle Squadron of six to eight vessels.
Riders are able to substitute additional armor and weaponry for the tonnage formerly occupied by the jump drives. Such a rider should be able to defeat a battleship of equivalent tonnage which is burdened with the necessary jump drives. The carrier has empty space t o hold the riders, and large jump drives that enable to total tonnage to jump.
The primary reason that Battle-Rider squadrons are procured is fiscal. For any given budget, the Battle-Rider concept produces a more powerful squadron at less cost. In addition, by increasing the number of hulls, the squadron increases the number of spinal mount weapons available.
Criticisms: The battle-rider concept is criticized on three points. First, a fair comparison of a rider versus a battleship should include the equivalent portion of the carrier's tonnage; in that case, one finds battle rider/carrier combinations require 120% to 150% of the tonnage of the battleship they defeat. Second, the carrier itself is an achilles heel for the squadron because it concentrates all of the jump capability of the unit in one ship. Third, deployment options for battle riders are limited; riders cannot be deployed individually and the deployment of a full complement of riders (as well as their recall) creates great vulnerability.
Tags: BCS.

Battleship
Jump capable ship intended to stand in the line of battle in space combat. Armament and protection are appropriate to this mission. They generally have little better primary armament than cruisers. Their extensive secondary batteries render them virtually immune to missiles and small craft attack, while their bulk provides a tremendous ability to absorb damage and keep fighting. The battleship concept involves large, well-armed and well-armored starships of massive tonnage capable of meeting almost any adversary. In a battle against a superior force, moreover, the battleship can flee using its own jump drives. 
See Battle Rider.
Tags: BCS.

Battle Tender
Interstellar transport intended to carry battle riders into combat. Integral to the battle rider concept, the battle tender is little more than a large dispersed structure with jump drives, fuel tanks, and basic controls. It transports a squadron of battle riders ready for immediate launch upon entry into a system. While the riders press the attack, the tender stays in reserve for protection. 
See also Battle Rider, Fleet Tender.
Tags: BCS.

BCS
See Battle Class Ships.

Battle Class Ships
The class of ships capable of standing in the line of battle. Typically this means ships which can carry a spinal mount.

Beauregard, Captain Argon Kevin
Generally held to be responsible for the defeat of the Empress Marava in the Battle of Sulgami, 620, by Ivan, who was subsequently proclaimed Emperor. Beauregard was commanding a Fleet Carrier in the Reserve Division when, through enemy action, command of the Division passed to him owing to seniority. When a large force of Ivan's Strike Cruisers broke through the main line, Beauregard jumped his ship to safety and left the Division temporarily leaderless. Marava's position became untenable, and she ordered a wholesale retreat. 
Beauregard afterward claimed he had undergone a 'religious experience' during the battle, and wisely chose to quit the Imperium before an organized pursuit could be mounted. Though connected with certain acts of piracy along the Outrim, his final destination and fate remain mysteries.
Tags: history.

Behind the Claw
A slang term used by inhabitants of the Spinward Marches, Deneb, and Trojan Reach Sectors to refer to these areas The term derives from a supposed resemblance between a claw and the Great Rift, as seen on maps of the Imperium. Inhabitants of this region feel a certain pride in this designation, and it is used to imply that they share a camaraderie and common interest The name was once used as the title of a popular news magazine with a circulation area encompassing the three sectors named above The term is rarely used by inhabitants of other areas of the Imperium
The entire area “behind the claw” is part of the Domain of Deneb. 

Belt Mining
The process of extracting useful minerals and other substances from asteroids. Asteroids fall into three basic categories, each of which is different in nature and value. 
Nickel-iron asteroids are reasonably dense, high-grade sources of metal of most value to the manufacturing industry; large asteroids can be sold to local shipbuilding concerns as planetoid starship hulls.
Carbonaceous asteroids are the most common planetoids and have the lowest value of all asteroids in most marketplaces. These stony chunks have the most value in systems where space colonies and large stations can make use of the variety of the useful elements -- carbon, hydrogen, oxygen, and so on -- that can be extracted from them.
Ice chunks are made up of various frozen volatiles, including methane, water, and the like. These “dirty snowballs” are a source of hydrogen fuel and hence support an entire specialty of “ice miners” who seek them out. In systems where gas giants cannot be used for one reason or another, a starport or space station may pay reasonably good money for ice chunks, though they will never make a better rich.
None of these three categories of asteroid is particularly valuable, and few betters ever made a fortune strictly from discovering and mining any of these. In point of fact, there are other things to be found. Many asteroids, most particularly nickel-iron rocks, contain varying amounts of the valuable minerals, platinum, iridium, and so forth, and sometimes radioactives. Occasionally an asteroid will be discovered with an unusual configuration that makes it valuable for scientific or even aesthetic purposes. And, finally, there are artifacts, which take in the entire gamut from the flotsam of a week-old wreck to a trove left by the Ancients, and which vary in value accordingly.

Belter
Strictly speaking, one who practices the profession of asteroid prospector and miner, usually working alone or with a small number of partners. Loosely, any resident of an asteroid belt (including citizens of civilized belts such as Glisten, some of whom have never been in a spaceship).

Bilstein Yards
The Bilstein company of Glisten (Spinward Marches/Glisten) has achieved a high reputation for specialist starships of nonstreamlined types. Though constructing on a small scale compared to builders like Ling Standard, Bilstein vessels are sought after due to their attention to customers' special requirements.
Bilstein is the main supplier of private yachts to the March nobility, and this provides the bulk of their output. Occasionally, however, a class of vessels such as the Leviathan merchant cruisers are turned out, and several powered planetoid types have also been constructed.
1116: Since Strephon's murder, Bilstein has begun retooling its lines to produce a series of planetoid warships to defend the Domain of Deneb from outside intruders
Tags: shipbuilder shipyard.

Black Globe Generator 
A rudimentary force screen generator producing a characteristic black globe surrounding its mechanism. The Black Globe blocks the entry of matter and absorbs all incoming energy (light, heat, radiation, impact). Absorbed energy becomes heat which raises the overall interior ship temperature. The globe is black because no energy is re-emitted or reflected. Because a black globe does not emit or reflect energy, it is undetectable by many sensors. When the screen is dropped, the energy is then radiated away as heat. TL 16.
The generator has several disadvantages, primarily the lack of any contact through the screen (which calls for inertial navigation and absolutely no maneuver while the screen is up) and the danger that the generator will overload with absorbed energy (the resulting explosion effectively transfers the energy which it has absorbed to the interior of the ship). 
Tags: defense.

Black War
Deep and highly destructive wartime strikes, to the point that infrastructure is reduced beyond an empire's ability to repair itself. Similar in principle to commerce raiding, it involves surprise strikes at the enemy's unprotected economic power. This results in the destruction of resources that, under other circumstances, might spur a rebuilding phase in an interstellar culture.

Boneyard
A cemetery world, a planet heavily populated before the Collapse, but which lost most of its population. Often a treasure trove of technological artifacts, but a psychologically taxing work environment. Also known as a cemetery world.
See Dieback World.

Bretremoy Military Transport
QSP T-KU33. Using a 1,000-ton unstreamlined hull, the Droyne Transport Bretremoy is a military ship typically placed in service for a Droyne oytrip. It is fitted with the Nethosmeres-1 Grid E3 jump drive, the Themyo Oe.33 maneuver drive, and the Domisse Mk3913-O power plant, and is capable of Jump-3 and 3G acceleration. Attached to the bridge is a computer Model/3. There are 4 triple-Droyne crew staterooms, 4 six-Droyne passenger staterooms, ten squad barracks, and no low berths. The ship has 10 hardpoints; installed on the hardpoints are 10 single barbettes armed with particle accelerators. There is one ship's vehicle: a cutter. Cargo capacity is 278 tons; the space is large enough to provide hangarage for a craft displacing up to 260 tons.
The ship requires a crew of 8: pilot, astrogator, 5 engineers, and medic. Up to 3 stewards may be added. The ship's troops man the guns. The ship can carry 24 passengers and no low passengers. 
Tags: Starships.

Brundle, Seth
Early experimenter in teleportation technology. He relied on a study of shape, given the problems of measuring the location of quantum particles. His methods of mathematical modelling are still in advance of practical current technology. Died as a result of a mysterious accident.

Brzk
Archduke of Antares. Brzk's great- (to the eighth) grandfather, Admiral Soegz, was a loyal supporter of Arbellatra in the final years of the Civil War.

Bulk carrier
Merchant transport. Typically 10,000 to 20,000 tons displacement. They are usually designed for a specific run, as it is almost impossible to profitably run ships this large without connections and an established route.

Bwaps
Minor race native to Marhaban/Lentuli (Empty Quarter 0426). Also called Newts.

Capital (Core/Capital 2118 A586A98-F)
Central world of the Imperium and seat of government since its founding. Situated in the center of the Imperium, Capital's astrographical position has proven of prime importance as a communications hub, a cultural center, and an industrial focus.
1116: Under the divided Imperium. with no emperor officially proclaimed by action of the Moot, Capital is a head without a brain, and the separate domains of the Imperium have been forced to fend for themselves under the independent leadership of their local archdukes. Once the current political turmoil has settled down and the Imperium is reunited, Capital will again take its place as the centerpiece of human civilization. 

Carried squadrons
See Tenders, Carriers.
When the carried craft are in the ten to thirty ton range, the ship is a fighter carrier. When the carried ships are in the 10,000 ton range and the large ship is 200,000 tons or more, the ship is called a tender or transport.

Carriers
Ships designed to carry large numbers of small combat boats, termed either fighters or system defense boats, to screen the battle fleet or support a planetary invasion. Fighters and light boats are little more than an annoying distraction in a major fleet action, but they can be extremely effective against ships of cruiser class or less.

Charted space
Humaniti calls its region by a variety of names, all of which amount to the same thing: charted space. This is an area roughly 500 parsecs across within which are concentrated more than a thousand starfaring races on, or regularly visiting, 80,000 worlds. Expeditions toward the galactic core have explored (and settled parts of) a narrow corridor some 30 parsecs across and more than 7000 parsecs long. Expeditions toward the galactic rim have reached nearly 3000 parsecs toward intergalactic space. Lateral expeditions have reached kiloparsecs in each direction. The results have always been the same.
     First, there is life everywhere. Worlds naturally spawn their own lifeforms, and many produce intelligent races. Second, nowhere beyond Charted Space has intelligence produced the jump drive that makes interstellar travel possible. Worlds are full of life: space is empty.
Tags: general.

Children of the March
A fleet intruder (later frontier cruiser) of the Azhanti High Lightning class. Tail number 6355. Laid down 095-0994. First flight 117-0997. Displacement 60,000 and heavily armed.
The Children of the March was unusual in this class of ships primarily for its method of finance. The boost to subsector economy created by the award of starship construction contracts is always important enough to make all areas of the Imperium vie for the privilege. At the time of the bidding invitations, the Solomani Rim War (990 to 1002) was burning on the other side of the Imperium; there was little chance that the Spinward Marches would receive a contract.
The Duke of Regina, speaking for the Marches, proposed that the marches fund one additional ship from its own resources, on condition that the Marches would receive a portion of the total run. The school children of the worlds within the Marches contributed their lunch money, at a quarter credit each, for the ultimate funding of one ship, and it was named Children of the March in their honor. Reportedly, some backwater schools districts still collect for the "Starship Fund".
Tags: history.

Chirper
Semi-intelligent minor race native to many worlds in and outside the Imperium.
Chirpers are omnivore/gatherers in the 25 kg class. Living in small groups with limited social organization, they gather fruits and berries, supplementing their diets with occasional small animals, which they catch and kill with crude tools.
Chirper intelligence is at the low end of the scale and ranges from a few points above animal levels to a few points below the average for humans.
Chirpers are named for the sharp bird-like chirp which characterizes their speech.
Chirpers are recognized by Imperial authorities as intelligent, and as such, they enjoy the protections and responsibilities of intelligent species within the Imperium. Most chirpers live in established reservations with only limited interchange with humans. 
Referee's Data:  Chirpers are immature Droyne who have not been casted. If Droyne do not caste, they continue development, though very slowly. Sexual differencesemerge, but casteless Droyne remain small and semi-intelligent and continue to resemble immature Droyne. Those Droyne groups which have lost the ability to caste (these are fairly common) live as primitives. Chirpers are also psionic, so they are impossible to catch. A chirper may occasionally befriend a human.

Church of the Chosen Ones
A fanatical Vargr sect which believes that the Ancients not only "invented" the Vargr race by genetic manipulation of Terran carnivores, but that the Ancients also returned to the Vargr several times and improved the race to the point that it could take its rightful place as the leader of this part of the galaxy. Some Church members even believe that the Ancients will return to bring this about. The Church has waned in influence since its founding 200 years ago, but it still has followers on many worlds. 
See also Vargr.

Church of the Stellar Divinity
The basic belief is that all stars are gods, conscious beings of transcendental power. If a person worships his sun, lives a good life, and follows the teachings of the Church, his soul will acquire spiritual mass, and be drawn into his sun upon death to join the deity. The church is popular in the Imperium, where it makes few demands upon worshippers, and does not compete with the government.

Ciencia lphegenia (b1088)
Grand Princess of the Imperium, daughter of Emperor Strephon and Empress lolanthe. As heir to the Iridium throne, Grand Princess lphegenia was educated from birth to eventually assume the mantle of authority for the Imperium. Her early fascination with the sciences prompted an extensive interest in the Imperial Interstellar Scout Service, which considered her its patron.
1116: The Grand Princess died in the assassination attack of the usurper Dulinor in 1116. 

Civil War
(604 to 622)
Fought between various factions within the Imperium for control of the bureaucracy. It had its origin in the strain on communications within the Imperium caused by the long time lags dictated by the very size of the Imperium. To cite one cause, however, would be simplistic. The diverse backgrounds of the many constituents of the Imperium had its effects, as did rivalry for power by major naval and military commanders and a lessening in the Imperium's expansionist tendencies.
The spark which started the Civil War came from the First Frontier War (589 to 604) in the Spinward Marches. Communication lags and a lack of preparedness forced the Marches to conduct most of the war on its own with little additional help or support from the Imperium. Grand Admiral of the Marches Olav hault-Plankwell forced the war to an end and found solid support for a new government. Marching on Capital with his war fleet, he forced an audience with Empress Jacqueline I, supposedly for recognition of his war effort. In the course of the meeting he personally murdered the Empress, and then proclaimed himself Emperor by right of fleet control. The ensuing power struggle lasted through 18 years and 18 emperors.
The fighting in the Civil War was of two varieties: fringe battles for power bases, and central battles for power in the Core. The fringe battles were fought throughout the Imperium as rival factions recruited forces. Once any power block built up enough strength to make victory seem possible, the forces were moved to the Core and used to either seize power or to wrest it away from someone else.
But there was also a cheaper, easier route open to many. The dynastic crisis of 244 had produced a precedent for assassination of the emperor if he or she overstepped the bounds of legitimate activity. The concept was introduced to legitimize the elimination of Cleon the Mad and was never intended for any other purpose. Nevertheless, in the turmoil of the Civil War, assassination was introduced and accepted, at least by those utilizing the technique, as a way of promoting a succession in government.
The line of Emperors during the Civil War came mostly from naval officers, and they are collectively called the Emperors of the Flag. Of these eighteen, seven were assassinated and ten were killed in battle; the line was ended by the person sometimes considered the eighteenth Emperor of the Flag - Arbellatra.
During the course of the Civil War, the Outworld Coalition (of Zhodani and Vargr) saw that their defeat in the First Frontier War at the hands of Olav need not be permanent. They attacked again in the Second Frontier War (615 to 620). Their defeat in that war had greater effects than they would know. Grand Admiral Arbellatra Alkhalikoi managed the meager forces of the Spinward Marches against the Coalition and forced a second defeat.
Arbellatra's strategy after the war was (like Olav) to march on Capital and seize power. She, however, did not make the mistake of seizing the throne. Instead, she defeated the putative emperor and then took possession of power, holding it in trust for a rightful successor. She held the post of regent for seven years while a search for a member of Jacqueline's family could be found to take the throne. 
In the stability that followed with her as regent, she made an impression on the Moot and succeeded in establishing a broad power base. Ultimately, the Moot approached her to take the throne herself, an end which was probably in her mind all along.
With the end of the two Frontier Wars and the Civil War, the Imperium entered a period of renewed expansion and consolidation. The express boat system was established to enhance government, commercial, and private communications; the Solomani influence in the Imperium was lessened and replaced with a more cosmopolitan policy; renewed efforts at interior development of existing Imperial territories provided a new focus for the nobles of the Moot. 
See also Emperors' List, First Frontier War, Moot, Outworld Coalition,Second Frontier War.
Tags: history.

Clan Severn
A Rhylanor based shipbuilder, with associated facilities on Jae Tellona and Margesi. The Rhylanor yard concentrates on filling Naval contracts, while civil and merchant operations are dealt with on Margesi. The Jae Tellona facilities engages primarily in maintenance and overhauls, but is also capable of constructing some of the simpler components for the other yards.
Tags: shipbuilder.

Client State
An independent political unit which has elected (or had forced upon it) the patronage of a larger political unit.  This relationship is generally mutually beneficial and is essentially commercial in nature. That is, the political or defensive ties which may be part of any patron-client relationship are ultimately intended to promote trade between the two.
Contrast with Pocket Empire.

Collector
The Collector is a specialized alternative Power Source. It slowly absorbs exotic particle energy and releases it in a burst which can fuel interstellar drives. A Collector is half internal mechanism and half external extendable canopy.  A Collector is unsuitable as a routine energy supply (the mechanisms of the ship must be powered by other sources); it only powers the Jump Drive. TL 14-21.

Combat Armor
Unpowered and fairly light-weight personal armor. Inexpensive when compared to battle dress, but providing comparable protection. Higher technology military forces routinely use combat armor. Integral communications equipment is common.

Confederation
Group of independent states, worlds, or systems united for specified purposes while generally retaining more freedom of action than the members of a federation. Also known as a league or alliance (especially of princes, nations, states, worlds, or systems).

Corridor
Imperial sector containing 267 systems dramatically split by the Great Rift; 69 systems lie rimward of the Rift and 149 systems form the coreward third of the sector. Corridor is named for its role connecting old, well-established Vland sector with the frontier sectors Deneb and the Spinward Marches. The name Corridor dates from about 140 and has displaced the old Vilani name (Eneri, rough translation: "star salad") for the sector.
1116: Corridor today is disputed territory, which lies be- tween the so-called Restored Vilani Empire and the loyal Do- main of Deneb. 

Coyns
Of the rare artifacts recovered from Ancient sites, the most common are coyns, small disks of metal engraved with various symbols. Their specific use is unknown. It may be that the objects served as money, jewelry, mystic foci, or some other unknown purpose.
Original coyns have been found in various precious metals such as gold, silver, platinum, iridium, monadium, and even uranium. Sets range in size from six to thirty-eight pieces and are considered desirable to museums throughout the Imperium. Each coyn has a scrap value of Cr400 (if gold); to a museum, the value is closer to Cr4000.
Copies of sets of coyns are made of aluminum, lead, or zinc and are more frequently encountered from unscrupulous merchants or traders. Such fake coyns have a value of about Cr20 each.

Crisis of '99
Albert Croale, in his book Almost Disaster presents a hypothesis that the Third Frontier War (979 to 986) occurred two centuries too late. After reviewing the progress of events in the spinward reaches of the Imperium from the antebellum period to the late seventh century, Croale then analyses the rise of the Psionics Institutes, their growing public acceptance, and their spreading power. Finally, he presents that a straight projection of events would predict a resurgence of the Outworld Coalition, increased hostilities, and a Third Frontier War.
Instead, his hypothesis as stated in his book indicates that the Psionic Suppressions (800 to 826 and beyond) were a massive manipulation of the population of the Imperium, a form of psychohistory, intended to eliminate the power of the institutes. Preparations were ongoing for war, and the Imperium made representations of strength (in 799) to the Coalition. It backed down.
But, the pyschohistory project went wrong and resulted in widespread rejection of psionics as a whole within the Imperium to the point that even the government had difficulty in using the science of psionics for its official purposes.
Tags: history.

Cruiser
Ship capable of independent operations and of support of the main line of battle. Size ranges from 20,000 to 100,000 tons: these are the smallest ships able to carry the large spinal mounts needed to cause serious damage to a large, armored ship. Cruisers are intended to fulfill diverse missions.

Currency, Imperial
The basic unit of legal tender in the Imperium is the Imperial credit. Individual worlds may issue their own currencies, and those currencies may or may not be acceptable on other worlds. Similarly, corporations and megacorporations may issue scrip, and its acceptance outside of the corporate environment is a matter of conjecture. But Imperial credits are accepted everywhere in the Imperium and many locations outside of it.
Imperial credits are almost impossible to counterfeit because of their unique method of manufacture. Plastic fibers are combined under high temperature and pressure and extruded as a rectangular bundle of great length. The different colored fibers form the pattern of the bill. It is not printed but actually made a part of the structure of the note. The bundle is sliced into paper thinness, and a 14-digit alphanumeric is added for uniqueness.
Credit bills are issued in 10, 20, 50, 100, 500, 1000, and 10000 credit denominations. Plastic coins, manufactured in a similar manner in various shapes, are issued in quarter, half, one, and five credit denominations.
Imperial credits can be bulky in large enough quantities. Bills measure 75 x 125 millimeters; 1000 bills stand 50 millimeters high and weigh 500 grams.

Da Santos, Bennet Lai
A legendary March character, da Santos was a gentle- man explorer of the Fourth Frontier War era, who made his fortune with an un- canny knack of arriving on undeveloped worlds ahead of any rivals, sometimes only by a matter of hours, and of avoiding unprofitable ventures. Eventually settled somewhere outside the Imperium to avoid charges of tax evasion and bribery. Born in 1036 on Fosey/Mora (0201), whether or not he still lives is the subject of speculation. UPP576ABA.
Tags: history.

Darmine
Cultural region in the Zarushagar sector. Darmine had a separate but submerged cultural identity within the First Imperium and happily threw off that domination when the First Imperium fell. Allowed to flourish by the Rule of Man, the community of worlds survived the Long Night with little harm. 
Darmine was the major focus of the Ilelish Pacification Campaign (76 to 120).

Darrian Confederation
Group of worlds in the Darrian subsector (Spinward Marches) settled by humans from Darrian (Spinward Marches/Darrian 0627 A463955-G) during the period 1137 to -927.
The current capital is Mire (Spinward Marches/ Darrian 0527 A665A95-B).
The Darrian Confederation contains 18 worlds within the same subsector and has a population of 17.19 billion. Darrians are humans who developed independently on Darrian. Some Solomani blood is evident from Solomani traders who encountered Darrian in -1511 and provided them with sufficient technology to explore their subsector.
The Darrian Confederation is a Client State of the Imperium. It has had long standing conflicts with the Sword Worlds. 
1116: Since Strephon's murder, the Darrians have reaffirmed their loyaltyto the ImperiumthroughArchduke Norrisof the Domain of Deneb. 
See also Humans.

Delgado Trading, LIC
Originally a manufacturer of military hardware and widely known for their work in minaturization, Delgado has extensive holdings in heavy mineral mining and refining, publishing, antiquities trading, and recently, the toy industry.
Founded in 997, Delgado is the youngest of the megacorporations.
Stock Ownership: Imperial Family- 5%, Delgado family- 47%, Noble families- 27%, Private ownership-21%.
See Megacorporation.
Tags: company megacorporation.

Deneb
Imperial sector containing 385 systems lying beyond the Great Rift; named for the sector's brightest star, Deneb.
Deneb sector was fragmentarily settled by both Vilani and Vargr during the latter years of the First Imperium, but major development of the sector only took place after Third Imperium Scout Service explorations located major resource worlds in quantity. Industrial worlds that exploited those resources soon created trade routes and commercial ties that linked the Imperial core with the Spinward Marches.
Deneb sector is primarily Imperial. The Imperial border runs just within the coreward edge of the sector, and scattered Vargr systems (as well as non-aligned systems and client states) lie beyond the border.
1116: Deneb is part of the Domain of Deneb, a region loyal [o the Imperium under the leadership of Archduke Norris The sector is on red alert on its coreward border and is ready to defend against alien insurgents from the Vargr Extents. Its trailing border abuts the so-called Restored Vilani Empire, a rebellious sector containing Vland; occasional hostilities have been reported. 

Denuli Crystals
Unfertilized eggs of the shriekers of 567-908 (Shvreeyiyi) (1031 Spinward Marches). In 480, an explorer named Mtume Denuli chanced upon Shvreeyiyi. He stayed briefly, discovering a quantity of Shrieker eggs scattered about the plain. He kept them as keepsakes and only after his death did his estate sell them (for a fortune). There was no record of where he had found them. The gemstones' striking beauty and restricted quantity made them an extreme rarity of great value, and until the early 1100s their origin was unknown.
Denuli gems are worth approximately Cr10,000 each, and several hundred are available after newly arrived shriekers have scattered theirs about.
Shrieker parents return their unviable eggs to the valley as a sacred ritual; all shriekers insist that the eggs be left alone. Shriekers will not part with them, and would consider it a crime for others to use them as gemstones. Since first contact, of course, pirates and exploiters have sought to plunder shrieker eggs. If shriekers discover such activity, they will turn violent against the responsible individuals immediately. Others, so long as they do not become involved, will be left alone. The result of the shrieker reaction should be a severe beating and a confiscation of any denuli gems in the individual's possession.
Tags: history.

Dhaztuen Subsidized Packet
QSP M-FU13. Using a 600-ton hull, the Dhaztuen-class Vargr packet is a large merchant vessel intended to carry passengers and freight to ports of convenience. It has jump drive-J, maneuver drive-D, and power plant-J, giving a performance of jump-3 and 1G accelera- tion. Fuel tankage of 210 tons supports the power plant and allows one jump-3. Adjacent to the bridge is a computer Model/2bis. There are 36 staterooms and 10 low berths. The ship has six hardpoints and six tons allocated to fire control. lnstalled on the hardpoints are six single turrets: two single beam lasers, two single missile racks, and two single sandcasters. There is one ship's vehicle: a 95-ton shuttle. Cargo capacity is 33 tons (supplemented by 49 tons capacity in the shuttle, which generally travels loaded). The ship is unstreamlined.
The Vargr packet requires a crew of nine: pilot, navigator, three engineers, medic, and three stewards. Provision is made for three additional crew -- gunners -- with the stewards trained to fill the other gunnery positions. The ship can carry 24 high or middle passengers and 10 low passengers. The pilot and a steward/gunner crew the shuttle. The shuttle can carry 44 passengers and 49 tons of cargo.
Tags: Starships.


Dieback World
A world whose population suffered extinction, but probably has still-working or salvageable technology.
See Boneyard.

Digest Touring Award
Outstanding journalism award offered every seven years by the Travellers Digest magazine (a popular magazine with a wide circulation in the spinward sectors of the Imperium, available on either plastic vellum or electronic media).
The recipient, who must be a professional journalist living and working "behind the claw", is given honorary membership in the Travellers' Aid Society (worth one million credits); he or she is then expected to travel through the region during the tenure of the award and to submit a feature article once every thirteen weeks. The intent of the Digest is to "promote understanding of cultural diversity within the Imperium". The most recent winner of the award, in 1114 is Selenia Stensen, a well known journalism professor from the Torri Institute on Trin (Spinward Marches/Trin's Veil).

Directions, Galactic
North, south, east, west are insufficient terms for referring to directions within the galaxy. Instead, the following conventions have achieved widespread acceptance when referring to direction:
Toward the galactic core (toward Capital from Terra) is coreward; away from it, in the direction of the rim, is rimward. In the direction in which the galaxy is rotating (toward the Spinward Marches from Vland) is spinward, and the opposite direction is trailing.
These directions are widely used in describing Imperial features and businesses. For example, the Spinward Marches is a sector at the extreme spinward fringe of the Imperium; Rimward Lines is an important interstellar transport company.
Finally, within the Imperium, the term coreward is also used to indicate the direction of Capital, the Imperial core. There is some potential for confusion if the term is accepted out of context.

Disintegrator/Disruptor
Barbette weapon. Disruptor suppresses the charge on the electron. Chem- ical bonds break; compounds disintegrate. Atomic nuclei exhibit a positive charge, repel their neighbors, and create an expanding cloud of particles. TL 18.
The Disruptor is a relatively slow weapon. Focused on a target, it boils away armor layers over the course of minutes.
Disruptors boil off armor in layers.
Disintegrators require two identical Weapons in identical mounts in order to make one Attack. 
Tags: defense.

Domain
Group of four sectors within the Imperium under the general control and direction of an Archduke.

Donosev, Villemina
Master Chief Surveyor of the Imperial Grand Survey when the First Survey was published in 420. Her unstinting devotion was instrumental in bringing the hundred-year project to a close.

Dreadnought
Heavily armed and armored starships intended as the mainstay of the fleet. Battleships are the ultimate in capital ships with the highest available firepower and armor. Monitors are heavily armed ships without jump-drives.

Drop Tanks
Disposable liquid hydrogen fuel tanks used by starships to increase their fuel load. These tanks are fitted to the outside of a ship, and drop away before jump. The result is more interior space available for cargo and passengers. Tanks must be replaced each time they are used, so they are practical only on runs to civilized areas, or to increase fuel capacity to allow several jumps.

Drop Troops
Specially trained units assigned to planetary invasions. Drop troops are inserted into planetary atmospheres from orbit, free-falling to the ground in individual re-entry drop capsules. Also known as Jump Troops.

Droyne
Intelligent major race inhabiting scattered worlds within an area larger than the region of the current Third Imperium. The Droyne are a small race derived from winged omnivore gatherers.
They vary in size depending on caste but generally stand one meter tall (large workers and warriors can be larger than humans). The history of their evolution remains a puzzle because their homeworld is not known with certainty.
Droyne society is divided into rigid castes determined when an individual reaches adolescence. The six castes of the Droyne each serve different functions within Droyne society. Although identical at the time of caste selection, caste members develop pronounced physical and mental differences by maturity. Different genetic programs are awakened by differences in diet and environment among the various castes. Young leaders, for instance, experience a nearly 30 percent increase in brain size in the first year after casting. The following are descriptions and definitions of castes:
Worker: Manual labor and mundane ordinary activity are the province of the worker. Workers are not too smart and are temperamentally suited to contentment with ordinary labour and subservient tasks.
Warrior: Trained for combat and possessing comparatively well developed muscles and reflexes, the warrior is the security troop, the marine, and the policeman of the Droyne culture. They are common in frontier bases, and less numerous in civilized areas.
Drone: Drones have a variety of purposes in Droyne society. They perform a reproductive role which makes them both fathers and mothers to Droyne young, and they have a role in the ceremonies which determine caste for maturing young. In addition, drones comprise a sort of middle management caste, which is responsible for many of the routine functions in business, trade, and administration.
Technician: This caste is the science-oriented portion of Droyne society and is concerned with both research and practical implementation of technology.
Sport: Although the caste system of the Droyne is rather rigid, the sport is the deliberately accepted exception to caste structure. Sports are special individuals who cross caste lines to become scouts, messengers, representatives, hunters, prospectors, and to take other occupations that require individual initiative or separation from Droyne society for long periods of time. A sport is the most commonly encountered Droyne outside their own worlds.
Leader: Leaders are required to manage and direct society. They are ultimately responsible for everything that the Droyne as a whole do.
Society: There is little individual freedom in Droyne society, and as a result, society and government join into one concept. Workers work. Leaders lead. All of society is dedicated to continuing the existence that provides all members with food, shelter and the other amenities that make life enjoyable. In addition, there is little discord in Droyne society when things are running smoothly, as each member of society has its own function to perform. Only when disaster occurs is the group forced to strain.
A typical Droyne group consists of a variety of Droyne from the different castes. There will be many workers, few drones and leaders, and technicians and warriors based on current needs. Each group will also have several sports, although they may not be present; instead they may be occupied with their own solitary tasks.
This is not to say Droyne are mindless. Leaders are quite capable and responsible; warriors have strategic and tactical senses; technicians are inventive and clever. But all accept the central group as a part of their lives and work for its benefit above their own.
See also Oynprith.

Dulinor
Archduke of Ilelish. The newest of the archdukes, appointed by Strephon in 1099, a decision which has since met with much controversy.
1116: Assassin of Emperor Strephon (in 1116) and pretender to the Iridium Throne.

Ebokin
Sophont race native to Yebab. Ebokin (singular: Eibokin) are bilaterally symmetrical and are built low to the ground, with eight legs and four small manipulative arms set close to the head. Adult female Ebokin average 0.8 metres tall, 1.5 metres long, and 130 kg in weight; males are somewhat smaller. Ebokin society is a very conservative matriarchy, bound by strict, unchanging laws. Ebokin seldom leave their homeworld.

Efate (Regina 0105 A646930-D)
Spinward connection in the vital express boat route leading to the Jewell subsector.  Occasionally the site of bitter anti-Imperial guerilla activity.

Emissary
Ex-imperial Navy fleet intruder (formally the Sparkling Distress) of the Azhanti High Lightening class. Tail number 6379.
Laid down 138-997. First flight 121-1000.
Currently in Oberlindes Lines service in the Vargr Extents.
Somehow, Oberlindes managed to purchase the ship with its weaponry intact, which violates Imperial regulations. Thus, the ship is unable to return to the Imperium. However, the Emissary has operated successfully as an Oberlindes flagship in the Extents and has proven effective, by the implied threat of its presence, in protecting Oberlindes shipping from piracy. The Emissary is armed with a large spinal mount particle accelerator and considerable secondary weaponry

Emperors of the Flag
During the Civil War period (604 to 622), the Imperium was in the hands of a series of naval officers of flag (admiral) rank. These eighteen emperors achieved the throne through assassination, fleet action, political maneuvers, and general mayhem. The year 619 particularly saw six emperors hold the throne, none of them for more than three months.
The succession of Emperors of the Flag began with the seizure of the throne by Olav hault-Plankwell in 604, which precipitated the Civil War. It ended with the naming of Arbellatra as regent of the Imperium by the Moot in 622. 
See also Civil War.

Empire
Group of independent states, duchies, nations, tribes, worlds or systems under the supreme rule of one emperor.

Express Boat
Rapid communication ships which are designed to make optimum use of jump technology in communicating information within the Imperium. Because the Imperium is so large, ordinary communication must depend on ships travelling along established trade routes, making Regina nearly 4 years out from the Imperial Core.
The express boat (abbreviated Xboat) system, established originally in 624 and expanded to cover the entire Imperium by 718, cuts this communication time by nearly 75 percent. Selected locations along major trade routes are established as sites for express stations, which are orbital facilities which service and refuel the Xboats on their communication runs.
As an Xboat arrives in a system, it beams its recorded data to the express boat station, which then retransmits it to an Xboat standing by for a jump outsystem. Time between jumps is almost always less than four hours and has been recorded at under seven minutes, making the speed of communication nearly the speed of jump (since Xboats carry jump-4 drives, speeds near four parsecs a week). In practice, this speed is somewhat reduced by the fact that trade routes do not follow straight lines and that not all jumps are made at jump-4. Nonetheless, the system achieves approximately jump-2.6 per week.
Tags: Starships.

False War
(1082 to 1084)
See Fourth Frontier War.

Far Trader
Variant designation of an independent merchant starship. While such ships are traditionally called free traders, vessels with jump-2 capability (twice the normal rating) are called far traders. Unscheduled service, but often the only way to reach some worlds.
QSP A2-BS12. Using a 200-ton TL 11 streamlined hull, the Empress-class far trader ranges far and wide, and deals with every world it finds. Even amber zones and red zones are not considered off limits by its captains, provided there is profit to be made and the risk of being caught is slight. It has drives capable of jump-2 and 1-G acceleration. Fuel tankage supports jump-2 and one month of operation, and the ship incorporates fuel scoops and fuel intakes for wilderness refuelling. The bridge is standard and has a computer Model/1bis and a basic sensor suite. There are two hardpoints, but no weapons are mounted.
Like the free trader, the far trader is built around its cargo bay, in this case 64 tons. The ship has ten staterooms (three for the crew; seven for the passengers) and four low berths. A single air/raft is carried (in cargo) for various surface duties. The ship is streamlined, and can land on uneven terrain. The far trader requires a crew of three: pilot/astrogator, engineer, and steward.
Tags: Starships.

Federation
Group of states, worlds, or systems, each internally independent, joined into a union to which has been surrendered certain rights and responsibilities, most generally to do with foreign affairs.

Festival
Annual celebration staged on Rethe (Regina 0808 E230AA8-8).  Originally a reaction to the restrictive government considered necessary for survival on Rethe, the three day holiday period has continued as a carefree celebration where citizens release the tension that has built up during the preceding year.  All laws are suspended ( local law level becomes 0 ) during the festivities.  Some abuses have always been present, but the population has resisted any effort to change the conditions of their favorite holiday.
The Travellers' Aid Society classifies Rethe as an amber zone during the period of Festival.

Fifth Frontier War
(186-1107 to 099-1110)
Latest in a series of wars between the Third Imperium and the Zhodani Consulate. 
The war began with a Zhodani declaration of war, delivered to the Imperial government at Regina and Jewell simultaneously. The very fact that the Zhodani knew the war was beginning, and the Imperials did not, gave them a great advantage. They were prepared, and struck even as the declarations were being deiivered. Zhodani fleets struck through the Jewell subsector and besieged Jewell and Efate. By 1109 the siege of Efate was being prosecuted only half-heartedly. They had also committed themselves to attacking the Regina subsector through the Abyss.
The Zhodani committed themselves to the Abyss Campaign in three steps: a move to the Imperial border, creation of a solid break in the Imperial front lines, and a follow-through deep thrust to Rhylanor. The plan could spell the fall of Rhylanor and the capitulation of the Imperium; the Zhodani depended on the plan to win the war for them.
The Imperial responses during the opening weeks of the war were confined to reactions.
As the Zhodani 15th Fleet pushed closer to the border (mid-1108), the potential threat was recognized and the Corridor Fleet assigned to protect the region. Almost immediately, the Corridor Fleet was diverted to reinforce the threatened regions of the Regina subsector. The pressure of the Zhodani 1st Assault Fleet at Efate in late 1108 induced Admiral Santanocheev to move the Corridor Fleet into Regina subsector. That move left the Abyss open just as the Zhodani 40th Fleet broke through at the border and pushed for the Abyss. Once they established their Tureded base, the 40th Fleet jumped off to attack and invade both Porozlo (2715) and Rhylanor (2716). 
When Duke Norris of Regina seized power on 132-1109, he took immediate steps to consolidate his own control of the fleets. By 190-1109, he had diverted the Corridor Fleet to Rhylanor and Porozlo. The clash between the Imperial Corridor Fleet and the Zhodani 40th Fleet was bloody, but quick. The reduction of Rhylanor called for surprise; in the face of intense opposition and substantial Imperial reinforcements, the attack could not succeed. The 40th Fleet broke off once its losses reached critical levels, and headed back toward the border, suffering further mailing at Calit along the way.
With the failure of the 40th Fleet's assault on Rhylanor, the war had two possible courses: a long succession of sieges or an immediate armistice. On 116-1110, representatives of the Imperium and the Zhodani Consulate met at Esalin (1004) to discuss a cease fire, imposed as soon as word could be disseminated to the fleets. It was agreed that there would be no territorial gains for any participants. However, Darrian refused to call its reclamation of territory originally Darrian as gains. Similarly, the Imperium pointed to its prior occupation of Quar in the Chronor subsector to refute charges of territorial gain as applied to that world. Other than those two border changes, the Armistice of 1110 called for a return to the status quo.
The only other major change in relationships in the Marches was the establishment of the Border Worlds Confederation from ten worlds in the trailing Sword Worlds. Although a client-state of the Imperium, it remains independent and sovereign.
Tags: history.

Fighting Ships
Fighting ships are ranked Principal or line (the best available), Major (better than most) and Minor (merely acceptable).
A Cruiser is the principal type of offensive fighting ship (in both weapons and defenses). A Frigate (although less than a cruiser) is a major type. A Corvette is a minor type (a small craft in this mission is an Attack Fighter).
A Monitor is the principal type of defensive fighting ship (favoring armor over firepower). A Defender is a major defensive ship; an Escort is a minor type (a small craft in this mission is an Interceptor Fighter).
Ships for operations against worlds include Ortillery for firepower and bombardment, Assault to deliver troops and equipment, and Sentinel to counter attacks from the surface.
Independent naval forces include: Corsair to attack commercial shipping (specifically to steal its freight or cargo). Raider to attack and destroy commercial shipping. Marauder to attack ports and installations.

Final War
1116: The war, 1117-1130, that ended with the release of the AI Virus and spelled the end of the Third Imperium.  Also known by various factions as the Civil War, the Second Civil War, the Succession War, or the Rebellion.
Tags: history rebellion.

First Frontier War
(589 to 604)
The first of the border clashes between the Imperium and the Zhodani, which sparked the beginning of a continuing antipathy between the two major lines of humaniti.
With the conclusion of the war, Olav hault-Plankwell returned to the Imperial core with his war fleet and took the reins of government, dispatching Empress Jacqueline and thus starting the Civil War and the reign of the Barracks Emperors.
Tags: history.

First Imperium (-4045 to -2204)
The first major interstellar civilization, politically and culturally dominated by humans originating on Vland. The jump drive was discovered on Vland in -9235. Immediately the Vilani discovered a number of inter-fertile and technologically primitive human races on worlds within 60 parsecs. These were gradually brought to a high technology state with Vilani help and assimilated into a loose interstellar community bound by trade and common culture.
Eventually, the client races themselves explored beyond the local sphere, contacting and trading with still more races. These new races gained their technology without being assimilated into the Vilani culture; the resulting increased friction caused a series of wars beginning in about -5400.
In response to the threat, Vland began tightening its control of its trade sphere, and finally organizing it into a centralized state in -5273. This marked the beginnings of the First Imperium, although there was as yet no emperor. During the thousand year period of the Consolidation Wars, Vland conquered and absorbed its enemies until there were no longer any civilized states on its borders (except for a portion of the Vargr Extents, isolated from the Imperium by the Windhorn).
The last war ended in -4045, and the Vilani declared the establishment of an interstellar empire to govern all Vilani territory. Known as the Grand Empire of the Stars or Ziru Sirka, Vilani dating begins at this point. With no exterior threats, the Ziru Sirka lasted for nearly 1200 years; at its height, which was attained soon after the end of the wars, the First Imperium contained 27 sectors and over 15,000 worlds.
However, the cost of maintaining centralized control over this vast expanse was cultural rigidity; exploration had ceased with the beginning of the wars; now scientific research slowed to a halt, and the beginnings of a hereditary caste system began to emerge. Civilization was in decline.
As long as there was no exterior threat, the Grand Empire was safe; but gradually, despite all efforts, technology leaked across the borders. New interstellar states arose, and the Imperium could no longer afford to absorb them. Slowly, the Imperium lost territory along its coreward and trailing marches. Then, in -2422, the Imperium was contacted along its rimward border by the Terrans, who had recently emerged into space. Terran expansionism led to a series of interstellar wars, which ultimately resulted in Terran conquest of the Imperium in -2204 and the founding of the Rule of Man.
Tags: history.

First Interstellar War
(-2408 to -2400)
The first military engagement between the Vilani of the First Imperium, and the Solomani of the Terran Confederation. This began an on-again, off-again series of wars between these two major human races, which ended in the defeat of the First Imperium and the beginning of the ascendance of the Solomani.
See also Nth Interstellar War.
Tags: history.

Flame Sculpture
A Darrian art form. Developed before the supernova which destroyed interstellar interaction in that region for 700 years. Initially, techniques were invented to shape flame using gravitic technology, application being in such things as cutting torches. However, it was discovered that the flames could be molded, and artisans began practicing this new art. Busts, landscapes, and other 3-D subjects were sculpted in flame, along with letters, company names and logos.
As with many Darrian artifacts, those created before the disaster (known as Early sculpture) are considered the best, and are all simple in form, with the rarest being sculpted while the Darrian worlds struggled to survive (known as Maghiz). Modern sculpture is far more complex than the older forms, and is less prized by art lovers.

Fledgling Lines
Small interstellar trade and transport companies are called fledgling lines. Some are free traders who have been diligent enough (or lucky enough) to make some money, and that money has been invested in additional ships. Others are veterans of the larger lines, now gone into business for themselves. Still others are partnerships, usually of several independent ship owners who have banded together to create a merchant line. A few are just businessmen, lucky enough to be awarded a merchant subsidy, and are now trying to make it turn a profit.
Nine out of ten fledgling lines fail within the first five years. Of those remaining, nine out of ten barely break even. Fledgling lines are the most common lines, the most risky, and have the greatest potential for achievement, however slim the chance.

Fleet Tender
A large (up to a million tons displacement) craft that carries a complete Battle Squadron (BatRon) of Battle Riders.
Tags: BCS.

Focaline Tree Rat
This small rodent-like creature is native to Focaline (Aramis subsector.) It weighs 3-4 kilograms and is 70-80 centimeters long: two-thirds of this length is tail. They are omnivorous: their sharp teeth can pierce thick fruit skins - or unwary fingers. They are semi-intelligent, and have an elaborate social structure in the wild. They mate for life, and bear young once a year after year three, in litters of about four "ratlings," and live about 15 years.
     Though they physically resemble terrestrial rodent types, tree rats have longer legs, feet adapted to grasping, and prehensile tail. The tail allows them to easily pick up small objects, and hang from tree limbs. Most sleep in that fashion.
     A red-brown fur covers their entire body, except for the soles of their paws. They seem able to adapt very quickly to temperature changes: exposure to cold weather for more than one week makes them grow a thicker and rougher coat.
     On their homeworlds, people view them with mixed dislike and appreciation.  They raid fruit-bearing plants, but also feed upon and control local pests. Tree rats have proved popular as pets, and starships have spread them throughout most of the spinward reaches of the Imperium.
     Their major drawback as pets is insatiable curiosity, which often leaves them locked in airlocks or food bins. They also collect bits of shiny or brightly colored materials (coins, keys, credit cards, security badges), depositing them in a nest in their owner's cabin. This can develop into a game: the tree rat starts by picking up a valuable item in its tail, and then races around the ship pursued by its owner(s).


Forboldn Project
Forboldn (0208 E893614-4): Primary colonization project within the Regina subsector. Originally conceived in 987 to utilize the resources of Forboldn, the project began its execution phase in 1089. Large numbers of colonists were recruited and shipped in cold sleep from the Imperial core, with arrival times set from 1110 to 1120. Simultaneous preparations on Forboldn began, with detailed planetary surveys to pinpoint resources and initial building projects to prepare industry and quarters for the arrival of colonists.
An interesting aspect of such colonization projects is the recruitment methods used to supply personnel. Since virtually no amount of money will entice an individual to leave his home and livelihood for the bleak desolation of a colony world, the Ministry of Colonization has established several programs t o produce colonists. Most obvious i s the colonize in lieu of prison term program. However, several other programs have also shown signs of success. In the unemployment insurance program, high population worlds have successfully used the colonization project as a means of reducing unemployment over the long term. In a similar medical insurance program, indigents unable to obtain medical treatment are provided with their needs in exchange for signing on to a colony. A colony's needs for skills are met through the anagathics program; qualified (and aged) individuals can be provided with anagathics to extend their lifespans in return for their providing such skills as administration, mechanical and electronic, and medical. Finally, a land grant program has provided a cadre of retiring veterans to supplement the new colony's military and police forces.
Tags: history.

Fourth Frontier War
(1082 to 1084)
Also known as the False War.
Short, inconclusive war fought primarily in the Jewell subsector (Spinward Marches sector) between the Imperium and the Zhodani Consulate. The war was in the Spinward Marches, with initial assaults by the Zhodani against Jewell and Regina subsectors stalled at the borders. Its final battle, the Battle of Two Suns, 1084, was waged in the vicinity of Yres and Menorb and resulted in Imperial victory. The armistice was signed before instructions for the conduct of the war were received from Capital.
Tags: history.

Free Trader
Interstellar merchants who own their own ships and are beholden to no government. The Free Trader pursues the merchant ethic of “buy low, sell high” in commerce between the worlds. Many rich merchants had their start on a Free Trader.
QSP: A-BS11. Using a 200-ton, TL10 hull, the Beowulf Class Free Trader is an elementary interstellar merchant ship plying the space lanes carrying cargo and passengers. It mounts jump drive-A, maneuver drive-A, and power plant-A, giving a performance of jump-1 and 1G acceleration. Fuel tankage supports a 1 parsec jump, at 20t per parsec, and one month of operations. Attached to the bridge is a Computer Model/1 std. There are 9 staterooms, an owner's suite, and 20 low berths. There are two single turrets, but without weapons installed. Cargo capacity is 82 tons. The ship has a streamlined hull, with scoops and intakes for frontier refueling. 
The ship has 4 crew, and can carry 6 passengers and 20 low passengers.
1200: Free Traders are scarce in the year 1200, as they are prone to fall prey to the innumerable hazards of space travel, which include, but are not limited to, xenophobic TEDs (which see). hostile free trader/pirates, pocket empires looking to adds ships to their meager fleets, vampire ships, and the increased danger of mechanical breakdown in areas that no longer have repair facilities.
Tags: Starships.

Frozen Watch
Reserve troops stored in low berths until needed.

Gaesh
Orbital Prison Hulk.
The Gaesh, the former Imperial Strike Cruiser (CS-9528), barely passed trials in 1087. The ship never attained greater than jump-3 in actual use. On 090-1098 the ship was paid off, its drive rooms gutted and converted to detention cells.
It completed its conversion to penal rehabilitation at an orbital site above Pixie (SPIN 1903) on 254-1098. Modern reform and rehabilitation methods are used on a variety of Imperial offenders in a setting removed from normal pressure and routine; the Ministry of Justice reports excellent results in its programs, with a recidivism rate approaching zero.
The orbiting prison is an interesting study in economy, converting an otherwise useless starship to an important social institution. The two upper decks have been retained for guard crew quarter and essential administration, while the three lower decks have been turned over to the inmates for quarter and recreation.


Galanglic
Primary language of the Third Imperium. See Anglic.

Ganulf, Manoeuvre of (Fourth Frontier War)
Important Note- Restricted to Naval Files only, In early 1084 during the Fourth Frontier War, Imperial forces assigned to the Egyrn subsector were drawn into a long series of skirmishes in the vicinity of Walei (0102) and Nabeth (0402). The reason for these became clear when a Zhodani task force arrived over Ganulf (0407) and overwhelmed the solitary guardship, the Light Cruiser Alchemda.
The Imperial resupply base with its small marine garrison held out for a short time, but eventually a spread of missiles penetrated a munitions storage silo, causing an immense nuclear explosion and sympathetic detonations in other storage areas. In the increasing convulsions that followed, Ganulf lost its thin atmospheric envelope and all life on the planet became extinct. Munitions at the base included certain experimental weapons, and the subsequent court of enquiry laid the blame on the logistics staff for inadequate storage safeguards. 
Tags: history.

Gas Giant
A large planet with an extensive atmosphere of hydrogen and hydrogen compounds. Such planets may or may not have a solid matter core. Starships fuel themselves by diving into this atmosphere and skimming hydrogen from it. Jupiter, in the Sol system, is an example of a gas giant.

Gazelle Class Close Escort
300 tons, QSP EC-DU25. An Imperial Navy standard class built by the hundred, and a common component of Navy task forces in the Marches. Designed specifically to protect against enemy skirmish forces and for general escort duty, the class is well-armed for its size and type. L-Hyd fuel tanks may be dropped in extreme circumstances, allowing jump-5. The tanks must be replaced unless a severe reduction in jump ability is to be tolerated.
Tags: general.

General Products, LIC
The largest starship manufacturer in Regina Subsector with yards at Regina, Efate. and Pixie. Originally a military contractor, General no longer produces ships for military use; instead it concentrates on the more lucrative commercial market, building starships, nonstarships, and heavy machinery of all sorts. The yard at Regina is capable of producing ships up to 5000 tons, while the subsidiary yards at Pixie and Efate are limited to 600 tons per ship, and devote most of their attention to annual maintenances. General is known for inexpensive products of adequate quality, but of late its starship division has been plagued with disaster. The corporation was formed by the merger of a number of smaller manufacturing concerns shortly after the end of the Civil War. 
See Megacorporation.
1116: Rumors of late indicate that General may be involved in negotiating a renewed series of military shipbuilding contracts. 
Tags: shipbuilder shipyards.

Glea (Central/Glea 2609 A667800-F)
Main coordinating centre of the Hive Federation since 410. Centre of the Glean Cluster, an unusually rich grouping of 16 Hiver-habitable worlds which are mutually accessible by jump-1 shipping.

Good War/Bad War
The terms "good war" and "bad war" are expressions used by mercenaries to differentiate between small-scale actions within the Imperium and full-scale wars between the Imperium and outside forces.
Small scale actions are viewed as good because the Imperial rules of war are in effect, and a unit knows that it will not be subject to nuclear weapons. Good wars are usually short and not particularly bloody. A unit in a tight spot need merely surrender and activate its repatriation bonds to be removed from combatant status. Even anti-guerilla actions are good, under this classification, because of the fact that although most guerillas usually observe no restraint with captured government forces, captured mercenaries can usually be ransomed to serve as a source of income.
A war is bad when no such controls are in effect, and a mercenary unit will be subject to the full horrors of war. Mercenary units are understandably reluctant to accept bad war contracts, but they may be forced into them, especially when near border areas.
Tags: mercenary.

Gramstaatsbedrif
Government-owned merchant company which provides merchant shipping, passenger service, and message express to the worlds of the Sword Worlds Confederation. It maintains standard, scheduled runs between all of the Swords Worlds.
Tags: company.

Grand Prince
Imperial titular designation of the heir to the Iridium Throne. Under Imperial custom, the eldest daughter or son of the Emperor becomes heir to the throne at the age of 12.
Elaborate ceremonies confer the title Grand Prince (or Grand Princess) on the heir and proclaim the information to the Imperium.

Great Rift
Broad expanse of space with a very low density of stars lying spinward of the main region of the Third Imperium. The Great Rift is a pronounced impediment to to interstellar travel, and it constrains jumps to the Spinward Marches through the Corridor sector.
The Great Rift is one of the many astrographic features which have provided long-term security for the Third Imperium. By its very nature, the Great Rift has made outside incursions difficult, which has made the interior of the Imperium a secure population center.

Groat
Herbivore native to Fulacin in the Rhylanor subsector. Individual groats are harmless, but the outer members of a herd will attack any perceived danger in groups.
Groats have been transplanted to several worlds in the Aramis subsector, most notably Focaline.
The groat's shaggy hair (known as groatle) is the most obvious resources it provides. Once sheared, cleaned, and groomed, it has a softness and silkiness rivalling the finest synthetic. In addition, groatle contains metal salts, which has two beneficial effects. First, groatle cloth is proof against most small lifeforms (such as Terran moths) which eat other animal fibers.
Second, a simple chemical treatment brings out an iridescent, shimmering quality which is very attractive. Groats are also raised for their meat, which is highly prized by Vargr.

GSbAG (Geschichtkries Sternschiffbau AG)
GSbAG (popularly known as Gas-bag) has restricted itself almost exclusively to the manufacture of starships.
Founded, according to company propaganda, in -2438 from a consortium of old Terran manufacturing firms. In actual fact, there is no concrete evidence of the corporation's existence prior to a contract with the Sylean Federation Navy in -334. Unlike other manufacturers, GSbAG (popularly known as Gas-bag) has restricted itself almost exclusively to the manufacture of starships since its earliest known existence.
GSbAG is one of two firms charged with the manufacture of the personal vessels of the Imperial family and is a major contractor for the Imperial military. Their products command extremely high prices, but it is generally conceded that the quality makes them well worth it.
Stock ownership: Hortalez et Cie- 19%, Imperial family- 4%, Noble families (includes the families of the legendary founders)- 44%, Other corporations- 13%, Private investors- 4%, Other- 16%.
See Megacorporation.
Tags: company megacorporation.

Guaran (Ricenden/Guaran 0827 A565800-F)
Homeworld of the Hivers. Guaran has no special political importance, although it attracts millions of tourists annually from all over the Federation.

Gunboat
Ultimately, the distinction between ground, air, and space craft disappears for military vehicles, and a single type of vehicle assumes all these roles for system defense. Called gunboats, they are capable of extended operations in vacuum, atmosphere, and water.
Individual vessels are strongly armed, and can fight enemy ships while later supporting ground forces or attacking enemy installations. Further, they can continue resistance for long periods, hiding in oceans or gas giants, and coming out only when there is the prospect of enemy losses.
Gunboats are usually fast, well-armed, and well-armored. They are capable of a wide variety of military missions, and have a high survival potential. Displacement: 200-600 tons.

Gvadakoung, Order of
Imperial order of knighthood established to honor loyal Vargr citizens.

Gvegh
A language group (including Gvegh, Gvegh-Aek, Knithnour, Uedhu, and Taeksu), spoken by 60% of all Vargr in the Spinward Marches, Deneb, and the sectors immediately coreward. Thus, it is the most commonly encountered Vargr language.
Tags: language.

Gvurrdon Hvaek: A great expansion period among the Vargr c. -2650.
Tags: history.

Hairpin hypothesis
Translation of a sarcastic Vilani saying disparaging over-reliance on technology: "No tool is so useless that something can't be found it can be used to fix."

Hiver
Intelligent major race with a large federation trailing the Imperium. Hivers average 1.5 meters from ground to top of upraised head and weigh about 150 kg. Descended from omnivore gatherer/scavenger stock, they are the most alien of the major races. Hivers exhibit a modified six-fold radial symmetry; the body has a calcareous internal skeleton consisting of a series of rings supporting the limbs and a fused carapace protecting the brain and internal organs.
The head is a modification of one of the limbs and contains six eyestalks and six manipulative tentacles, plus paired infrared sensor organs. The other five limbs are identical (except for slight modifications of the hand opposite the head) and are used as arms and legs indiscriminately. Each limb ends in a six-fingered radial hand. Fingers are very flexible and have muscular suction cups on the lower surface about halfway to the tips. Hiver arms and hands are generally weaker than a human's but are very tough and difficult to injure.
The mouth (digestive opening) is on the lower surface of the body. There is no sound-producing organ, but Hivers do have three ears placed around the neck near the head.
Hivers have only one sex. Reproductive cells are exchanged each time that Hivers meet, using the modified rear hand (the process has been termed by humans as "shaking hands"). The cells are kept in a reproductive pouch on the lower body surface where they conjugate and exchange genetic material. Once every forty days or so, a cell develops into a larva, which then drops from the parent's body.
Hive planets are mostly wilderness, and the larva enter the wilds, where most are killed. After about a year, survivors return to civilization, where they are welcomed into any nest and begin their education as citizens. Parental instinct in Hivers is very strong, and the young are adopted by the entire nest. (Note that this instinct applies only to the year old returnees; Hivers have no concern for younger larvae, and in fact they consider them minor pests).
Hiver language is a combination of arm/tentacle waving and physical contact. The written language is ideographic and is used as a standard language among the races of the Hive Federation. Hivers talking among themselves use all three aspects of language (gesture, touch and writing) at once, a process capable of great subtlety and sophistication, but unintelligible to the outsider.
Hivers are unique among the major races in that they had a complex culture before becoming sentient. Originally, they lived in the tunnels and built-up mounds of a large (1000 kilogram) burrowing animal. In exchange for shelter, they gave food. They farmed fungus and foraged outside for decaying vegetation and dead animals as a source of food for the fungus.
Burrowers were allowed to graze the in the farm tunnels. Hivers ate the fungus and whatever fresh food they could find outside. Intelligence arose as the outside environment changed, forcing the foraging parties to travel farther to discover new sources of food and fertilizer; foragers advanced from simple scavenging and gathering efforts to complex cooperative efforts of hunting and trapping live game.
Today, fungus remains the staple of the Hiver diet; fungus growing is a highly developed art. Most buildings retain the beehive shape and large underground tunnel complexes of the original burrowers, but they are constructed by machines; the burrowers (known as snohl) are now reduced to the secondary function of keeping the tunnels clean. Hiver attachment to them is essentially irrational; they just feel more comfortable with snohl around.
Society: Hive society is highly individualistic. The term "Hive" results from an early Human misconception which stems from the appearance of the Hivers' building and tunnel complexes. Nests contain from five to five hundred individuals, who are usually centered around some common endeavor.
While one hundred is an average size for nests (and was the size in precivilized times), larger groups may come together for some civilized purpose such as large manufacturing companies or universities. Small nests are usually spaceship crews or isolated research parties. A young Hiver will spend its first fifteen years in its home nest; thereafter, nest changes may take place as often as a modern human might change jobs.
Because of the nature of their reproduction, Hivers never experienced the population pressures so important to human history. The population of the homeworld is now only a few hundred million, only ten times greater than it was in prehistoric times. Predators control the young; when the adult survival rate rises, thus increasing the number of young produced, the predator population increases proportionately and the balance is maintained. Space colonization arose not from pressures but from curiosity, with which Hivers are amply endowed.
The Hivers have colonized only those planets with climates most pleasant to themselves; if the planet has no predators that like to eat Hiver larvae, they are imported. Because of the high birth rate, a colony will rapidly fill up to its maximum population level of a few hundred million and will then stabilize. Hivers like planets of size 6 or less, with thin or standard atmospheres and unvarying climates. Hiver enclaves, for commercial or scientific purposes, are found on worlds of more extreme characteristics.
Hive industry and business excels at communications technology and robot construction. Major exports include artificial and computer languages, translators, and sophisticated electronic hardware of all types. Hiver mathematical systems are in much demand for their power and elegance.
Tags: sophont.

Hive Federation
Human term for a loose interstellar community dominated by the Hivers; Hive Confederation is also sometimes used. The Hivers have only one culture and one language; the Hiver genotype (with individual variations similar in degree to differences between individual humans of the same race) is also constant.
The Federation government (if such a term is at all applicable) is mostly concerned with maintaining the uniformity of the Hiver culture and species. This is accomplished by frequent reproductive embassies from one planet to another. Members of many different nests will shake hands with everyone nearby in a sort of farewell party and will then board a large embassy ship bound for a far-off world. Once there, they will meet with as many people as possible, shaking hands and exchanging news, art, gossip, scientific information, political views, and so on for about a year. They will then return home for another year-long round of parties, discussions, and handshaking.
Most disputes among communities are handled in these embassies; others, considered too urgent or transient to wait for an embassy, are settled by judges. There is a considerable body of Hiver common law and custom, and a judge is a person who has spent years in study of the law; judges' decisions are not necessarily binding and are open to compromise, but they carry a great weight of custom.
The discovery of alien races and their integration into society required a slightly more formal organization, which grew out of the coordinating body which schedules embassies. Two additional bodies were established: the Federation Navy and a development agency.
The Hiver parental instinct was aroused by the discovery of numerous intelligent species less fortunate than themselves, and work began immediately to lift the "children" to civilization. An early experience with an aggressive race led to the establishment of a system of quarantined worlds, denied entry to (or knowledge of) interstellar society.
Covert operations are in progress on quarantine worlds to modify overly aggressive cultures into acceptable members of the Federation, and several quarantined worlds have so far been opened since the beginning of the program. So far, no quarantined race is close to achieving interstellar travel on its own; public debate continues on what to do in such a case.
The navy is the main instrument of military force. Hivers came late to the concept of war and are more comfortable with high-tech, long-range oriented violence; they dislike the personal approach of ground combat.
When ground forces are absolutely needed, other races of the Federation generally provide troops. Federation armed forces are essentially a deterrent force and are seldom used as an instrument of policy.
Other races of the Federation are equal partners in society, although the structure of society is Hiver generated, and those races able to adapt best to the Hiver way of life and customs have been most successful. All races participate in the embassies, although in a modified form.
Some associate species retain strong internal governments or police forces to regulate the aggressive tendencies of their members, but whatever solution is reached, all Federation member societies are nonaggressive.
Most worlds of the Federation have communities of several species; races inhabit the worlds they find most pleasant.

Hoard of the Sky Raiders (Collace Press, 1098)
Pseudoscientific tract written by Professor Jothan Messandi, formerly of the Institute for System Studies on Collace. The book's controversial theories have provoked considerable interest in research institutes across the sector.

Holiday Year
The year zero in the history of the Third Imperium, decreed by Cleon I to commemorate the establishment of the Imperium. Technically an aspect of calendar reform, the use of the year zero provides a central date point for counting years back into the Long Night and forward into the future of the Imperium.
The actual advantages of a holiday year are slight: centuries begin in the hundredth numbered year instead of the first numbered year, and the number of years between any two dates can be determined by subtraction.
More importantly at the time, the holiday year was used as part of the public relations campaigns which were impressing the authority of the Imperium upon local governments. The minor requirement of changing to the new calendar was used to determine the cooperation by those governments.

Hop Drive
The Hop Drive is an order-of-magnitude enhancement of the Jump Drive: its base TL of 17 means that it is rarely, if at all, encountered in Charted Space. Hop Drive performance is measured in tens of parsecs.
Tags: high tech.

Hortalez et Cie, LIC
Founded in 221 by Lucienne Hortalez, capitalized from family funds. Primarily a banking and investment house, Hortalez specializes in loans to planetary governments, underwriting of large scale projects, and other fiscal activities. Hortalez is one of the major insurance houses in the Imperium. In some regions (especially the Spinward Marches) the firm acts as a mercenary clearing house.
Stock ownership: Hortalez family- 74%, Other corporations 15%, Imperial family- 5%, Other- 6%.
See Megacorporation.
Tags: company megacorporation.

Horvath, Craig
Duke of Warinir and senior duke of Daibei sector. 
1116: When Lucan ordered Daibei's fleets transferred to the fight against Dulinor, Horvath assembled a council of nobles and established a neutral and independent Daibei.
Tags: history.

Howood
Extremely dense, striated material obtained from the trunk of the Howood tree, a rare plant native to Pretoria (Deneb/Pretoria) and known to grow on several similar worlds in the Spinward Marches. The tree concentrates metals from the soil in their extremely tough bark. Howood is aromatic and its scent is especially pleasing to Vargr. It is also beautiful; the size, colors, and intensities of its rings and striations vary unpredictably with the characteristics of the environment in which the plant grows.

Humaniti (former spelling Humanity)
Collective name for human races, including Solomani, Vilani, Zhodani and others. 
See Humans.

Humans
Intelligent major race dominating the Imperium and several additional interstellar communities. Humans stand a p proximately 1.8 meters in height and weigh about 100 kg. Descended from omnivore gatherers, humans developed intelligence in response to shifting climatological factors.
The most unusual aspect of humaniti is the fact that humans are present on many different worlds and stand at various levels of development on those worlds. The Solomani Hypothesis states that Humans evolved on Terra (Solomani Rim/Sol) and were scattered to many different worlds by the Ancients for reasons currently unknown The result is that many different, parallel human races exist and coexist throughout known space.
The three most widespread human races are the Solomani (humans from Terra), the Vilani (humans from Vland), and the Zhodani (humans from Zhodane).
See also Ancients, Humaniti, Solomani Hypothesis, Solomani, Vilani, Zhodani.
Tags: sophont.

Igsiirdi
Ruling council of the Ziru Sirkaa, which selects a new Ishimkarun. Members are elected by the three Vilani megacorporations.

Imperial Calendar
Calendar was established at the creation of the Third Imperium as a universal calendar reform. Dates count from the founding of the Imperium, the year "zero". Dates before zero are negative, dates after are positive. For example, Terra discovered jump drive in -2431. The Imperium was founded in zero. Emperor Strephon was crowned in 1071. 
The year is divided into 365 standard days, which are grouped in 52 weeks of seven days each. The lengths of days and weeks is a legacy of Terran domination during the second Imperium. Days are numbered consecutively, beginning with one. The first day of the year is a holiday and is not part of any week. For example, the first day (Holiday) of the twelfth century of the Imperium is 001-1100. The last day of the year is 365-1100.

Imperial Edict 97
This executive order is the enabling act for the use of Imperial warrants. Unusually obscure for such a wide ranging and powerful edict, it is nonetheless on file at all Imperial installations. The edict runs to 34 pages, much of it pure legalese; when distilled down, it proves very direct: an order to assist the bearer of an Imperial warrant with all the power you can bring to bear. 
Only the emperor has the power to issue these warrants. A similar edict (Imperial Edict 3097) provides limited power to the Archdukes of the Imperium to issue similar warrants, although they are limited in their duration and territory.
See also Imperial Warrant.
Tags: history.

Imperial Grand Survey
The Survey Office of the Imperial Interstellar Scout Ser- vice is known commonly, and even internally, as the IGS, the Imperial Grand Survey. It has responsibility for mapping and exploration within Imperial borders. The Outrim Void is technically within the Imperial borders, so exploration and survey here are the responsibility of the IGS rather than its rival Exploration Office.
Other offices within the Scout Service include the Exploration Office already mentioned, the Detached Duty Office (administering surplus scouts in the hands of ex-scout personnel), the Communications Office (operating the Xboat network which spans the Imperium), an Administration Office, Operations Office, and a Technical Office. Lesser-known functions of the Scout Service include the Xenobiotic Bureau (within the Exploration Office) dealing with non-human contacts, and the Ancients Foundation, an organization sponsored by the Imperial family and administered by the Scouts. The Ancients Foundation is responsible for the investigation of all discovered Ancient sites. Finally, there are rumours that a number of executive undercover forces operating under Imperial warrants inhabit obscure corners of the Scout Service, but little proof is available.
The Grand Survey is responsible, in addition to survey duties, for publishing its cartography, establishing traffic control procedures. and for enforcement of space vessel safety standards. The function of exploring unknown areas accounts for only a small percentage of IGS manpower and funds.
Tags: astrography.

Imperial Guard
Eleven regiments of highly trained, superbly equipped troops dedicated to the protection of the Emperor and the Imperial Palace. Accepted as one of the elite formations of the Imperial armed forces, the Imperial Guard is a respected unit with a long and honored tradition. 
One purpose of the Imperial guard is to provide a symbol of political unity for the Imperium. One Regiment is drawn from each of the seven Domains of the Imperium, with each serving a one month tour of duty as honor regiment in rotation.
1116: The current honor regiment is the Ilelish Guard, drawn from the Domain of the Archduke of Ilelish.

Imperial Naval Intelligence
Also called INI. It can draw on the entire assets of the Imperial Navy, and is primarily concerned with military intelligence. It tracks starship and troop operations, and can mount intelligence-gathering activities into all parts of the Imperium.

Imperial Research Station
The worlds of the Imperium manifest a wide range of technological levels. The Third Imperium has always allowed its member worlds a wide degree of latitude, and it meddles very little in local affairs. With communication limited to the same speed as transportation, a single offworld query can involve weeks, months, or even years before a reply is received. ln addition, the cost of offworld transportation (both in time and money) tends to limit the interchange of information, the shipment of experimental prototypes and other such activities that are basic to the dissemination of scientific knowledge. 
Most worlds have found that simply purchasing advanced technology from a neighboring world is impractical. Not only is such high technology expensive, putting it to any cost effective use requires that the technology be understood. 
Consider: as useful as Tech Level 8 solid-state chip circuits are, they cannot be used on a large scale without the knowledge of electronics or the ability to provide supporting circuits (power circuits, circuit boards, and so on), which further implies knowledge of photo processing, and even crystal culture. In the final analysis, attempting to jump to a higher Tech Level without passing through any of the intervening Tech Levels just doesn't work; one must pass through the lower stages of technological development on the way to the higher Tech Level. 
Regardless of what the individual member worlds do, there are also certain large-scale interests in the Imperium which back research projects. Such research is generally privately backed (such as under contract by multiworld corporations), or it is sometimes performed in established Imperial Research Stations.
Private Research. On a scale as vast as the Imperium, it is often cheaper to duplicate research rather than search out and contract for technology elsewhere in the Imperium. However, trade between worlds tends to introduce new knowledge and technology to those who do not yet have it. If a certain offworld item proves useful, local companies may try to achieve the same technology with the goal of entering into local manufacture. Local manufacture has the advantage of taking into ac- count local preferences, as well as providing local employment. It also avoids potential problems with licensing agreements and arrangements.

Imperial Research
The Imperium finances research into a variety of areas. Sometimes this is an attempt to duplicate technology observed or reported in neighboring cultures and not yet within the ability of the best known science in the Imperium. Other times, the research is an area of interest expressed by some Imperial body (such as spinal mount weapons research performed by the Imperial Navy).
Imperial research stations may be located on worlds which need a boost to the local economy or in remote systems far from the potential disturbance of Imperial politics Many different stations may be located in several systems of the same region, and many different areas of knowledge may be under investigation at one time.
In general, however, one station is constructed for one purpose, and it continues in a single area of knowledge for its en- tire span of usefulness. Its size, personnel roster, power plant capacity, and even visibility profile are dependent on its area of investigation.
Imperial backed research may delve into many areas. Some examples include black hole research (both large scale and mini-black hole investigation), instantaneous transmitter development (so far proving impossible), antimatter containment, new weapon development (such as disintegrator beams), black globe development, deep planetary scanning, psychohistory, mass population behavior prediction, genetic transformation of living organisms, self-aware robots and starships, stasis and time travel, personal shields, memory transfer, and total rejuvenation
1116: The divided Imperium is having varying effects on Imperial research stations. Some stations continue as if nothing has happened, others have been directed (under new authority) to change the focus of their research, still others have been either shut down or sacked by the local authorities for anything of value to the defense of the local realm.

Imperial Rules of War
To mitigate most of the potentially disastrous aspects of armed conflict, the "rules of war" evolved as an accumulation of unwritten concepts, which were established on a case-by-case basis. The rules of war have never been officially codified, both to prevent them being seen as an Imperial endorsement of war and to keep formal precedent from preventing Imperial intervention whenever the Imperium deemed it necessary. 
The main aim of the rules is maintaining the economic and military well-being of the realm. They give the Imperium the right to intervene only when local military action threatened this well-being. The primary causes of instability, as viewed by Imperial analysts, have been long-term economic dislocation and excessive extraplanetary influence:
A) long-term social or economic dislocation is suffered when a region loses its ability to carry on at its prewar level of activity.
B) Excessive extraplanetary influence is even more vague. Historically, the Imperium has tolerated the use of force as a necessary outlet for built-up political and social pressures. In such cases, a short war is deemed preferable to continuing tension, sabotage, political agitation, etc. However, attempts by extraplanetary forces, such as offworld governments or large commercial interests, to seize control of a world's affairs are beyond the scope of the "safety valve" rationale.
"Assistance" is tolerated so long as it is deemed appropriate to the level of legitimate interest in the affairs of the world held by the extraplanetary organization. For example, the Imperium has often tolerated the provision by megacorporations of providing training cadre, arms equipment, etc. on a limited scale, and even of training fully equipped striker units to local governments. However, when it appeared that the primary burden for the conduct of the war has been carried by an extraplanetary power, the Imperium has intervened, claiming the power is using the misfortune of a local dispute as a pretext for aggression.
Unlike the above rules, one prohibition is clear and firm throughout the Imperium: the use or possession of nuclear weapons of any type.

Imperial Stationery
The Imperial family has reserved (both by custom and by law) a distinctive design for its personal stationary. Well-known throughout the Imperium through its use for routine messages and for Imperial appointments, the form is cream colored and embossed with the Imperial Sunburst in gold. Both physical and electronic versions of the stationary are used.
Because it is used for Imperial appointments (even when issued blank for office use) all Imperial officials are familiar with the design and can readily tell physical forgeries from the real thing. Electronic versions are data encrypted with a special code lock and require a special hardware key to be unlocked, thus making even electronic forgeries difficult.

Imperial Sunburst
The symbol of the Third Imperium established by Cleon (the first emperor) when the empire was proclaimed. Images show him standing before the original banner with a golden yellow sunburst against a black background, representing Capital's G-type star against black space. 
In 247, the Eliyoh (a nonhuman minor race) joined the Imperium. To that race the symbology was unimpressive. The Eliyoh vision centered in the far infrared, which resulted in distinction between the official colors of yellow and black being impossible. So Empress Porfiria declared that the symbol would have no official color. 
The original banner in the Imperial throne room is still black with a yellow sunburst. The Imperial Interstellar Scout Service uses a red sunburst; the Imperial Navy yellow; the Imperial Army black; the Imperial Marines, maroon.

Imperial Warrant
Instrument of power issued by the Imperial Dukes, archdukes, or the emperor. A warrant is a written or electronic document on Imperial stationary provided to trusted agents of the Imperium as a method of bypassing the bureaucracy.
Typically, a warrant is provided to an individual who uses the power it provides to accomplish some mission of interest to the issuing official. Missions may include establishment of colonies in areas requiring development, the assumption of military command in the midst of a crisis, and the unilateral establishment of new noble lines to administer provinces which have suffered from war or economic collapse.
For example, Emperor Strephon sometimes exercises his power through agents rather than directly through the bureaucracy of the Imperium. These instances are rare, although there is reason to believe that such agents are more numerous than it appears. The Imperial warrant would contain a statement similar to the example below: “Capital. The bearer of this warrant is acting for the good of the Imperiumand the Emperor. Extend him every assistance. Strephon.”
See also Imperial Edict 97.

Imperiallines
Interstellar shipping corporation serving worlds off the main trade routes of the Spinward Marches.  Most class C starports in the Marches are served by Imperiallines.
Tags: company.

InStarSpec
A mining and exploitation company with corporate offices scattered about the Spinward Marches. The company has been known to meddle in local affairs in order to improve their profits; in some instances, the company keeps a few mercenaries on hand to guard their interests and serve as a military deterrent. 
Alenzar has a major corporate office of InStarSpec; its branch manager is Savor Hallin. InStarSpec owns the class C starport on Craw, co-located with its offices there. Determined to keep things under control, they patrol the planet from orbit with small ships (mercenaries again), to make sure visitors go to the starport. They also maintain a small base out near the gas giant, to tighten control of the system further.
Tags: company.

Instellarms, LIC
Founded in 626, shortly after the end of the Civil War, by Axel Murdoch, a retired colonel of mercenaries. Taking advantage of inside contacts in the Imperial military, Murdoch was able to obtain large quantities of surplus military equipment at very low prices, but still costing billions of credits. Where Murdoch got his financing is not known.
Murdoch's connections with various mercenary unit commanders coupled with a willingness to ignore the Imperial regulations on mercenary warfare where profits were large enough enabled Instellarms to dominate the mercenary arms trade in the coreward sectors of the Imperium within ninety years, and in the Imperium as a whole within two centuries.
Manufacturing, buying, and selling military equipment of all sorts, Instellarms is a specialty supplier of mercenary units of all sizes and types. Agents of the firm can often be found on a battlefield, negotiating the purchase of the equipment of the losing side before the battle is completely over. The company does not deal in interstellar vessels and chemical, bacteriological, or nuclear weaponry.
Stock ownership: Murdoch holdings, LIC- 32%, Hortalez et Cie 30%, Noble families- 8%, Ling Standard Products- 6%, Ichiban Interstellar, LIC- 5%, GSbAG- 5%, Sternmetal Horizons, LIC- 8%, Other- 6%.
See Megacorporation.
Tags: company megacorporation.

Interdiction
The Imperial practice of interdiction of worlds within the boundaries of the Imperium had long been a source of contention between liberal and conservative factions in the government. Interdictions must be approved by a member of the Imperial family, but generally such approval is given in response to a request from an interested service, which is almost always the Scouts or the Navy.
It is generally held that the Scouts recommend interdiction to shield a young or sensitive culture from the interference that trade and commerce will bring.
The Navy is held to be more vindictive in its recommendations, for they use interdiction to punish local governments or to hide its own mistakes.
Interdicted worlds are awarded travel zone red ratings by Travellers Aid Society. 
See also Red Zone.

Iolanthe (b. 1052)
Empress of the Imperium. Iolanthe, the daughter of the senior Duke of Gushemege sector, and member of a prominent Vilani noble family, married Strephon in 1079. Her primary avocation is the preservation of developing cultures within the Imperium.
1116: She was murdered, along with her husband the emperor and her daughter the grand princess, in Dulinor's assassination attack of 1116.

Iridium Throne
The symbol of the continuing line of emperors of the Third Imperium. The physical throne was originally an iridium construction on which the emperor sat. Over time, the term has come to represent not only the emperors throne, but the office of the emperor itself.

Ishimkarun
Vilani word, translated as Shadow Emperor.

Ishuggi
Archduke of Vland.
1116: ...and now Ishimkarun of the Ziru Sirkaa, the Restored Vilani Empire. As Ishimkarun, Ishuggi rules in the traditional Vilani manner - by proclamation.

Jgd-Il-Jagd
Minor race from Jagd/Sotri (Lishun 2307). The most technologically advanced gas-giant race in charted space: tech level 13.

Jamison Factors (Free Trader)
Jamison Factors operates the far trader Empress Nicholle as a tramp throughout the Spinward marches. Its crew of five works for shares of the ship's profits (which are sometimes non-existent). 
Home Port: The Empress Nicholle is registered out of Vland, but has not called there in over twenty years. Territory: Currently the Spinward Marches. 
Tags: company.

Julian War (175 to 191)
A war initiated by the Imperium, under Emperor Martin I, to annex the sectors of Meshan, Mendan, and Amdukan. After nine years of negotiation and diplomatic maneuvering with the many confederations of the area (each a member of a larger confederation), Martin mobilized the Imperial Navy against these states. In the first three years of the war, Imperial fleets pushed deep into Mendan sector, capturing the capital world of Lasla and several important industrial worlds. In 178, however, a minor bureaucrat in the government of the capital of a confederation in Amdukan sector had risen to power there and gathered around himself an alliance of neighboring confederations. This bureaucrat then proposed a defensive confederation encompassing all three sectors under attack.
This state, the Julian Protectorate (named for its founder), fought sporadic battles, doing its best to push back the Imperial fleets. Then, in 185, concentrated Protectorate fleets crossed the Lesser Rift in an end run against Antares, and with deep raids against the Imperial Depots in Antares and Ley sectors. With two local depots destroyed, the Imperium withdrew its fleets to protect its internal communication lines.
The Protectorate fleets then concentrated on the Antares cluster, a lightly defended group of worlds, which fell easily to their advances. Using these worlds as a base, the forces of the Protectorate carried the war into the Imperium. In 190 the Imperium lost several battles in attempting to retake the Antares cluster, and Martin I became convinced that the Protectorate could not be pressed into the Imperium, and gave up the fight. However, the war did not end there, as the Protectorate insisted on keeping a hand in the Antares cluster. The peace treaty included the establishment of the League of Antares as a compromise, ending the war in 191 on the Protectorate's terms.
Tags: history.

Jump Dimming
The transitions to and from jump space are momentous occasions during an interstellar trip. Following an old Vilani superstition, the pilot of a ship customarily dims the ship's interior and exterior lights before going into jump. Historically, this custom derived from the need for most of the ship's power to be diverted into the computer and jump drive systems, so that the jump drive can be guided into creating the jump field properly. Zhodani and Solomani pilots do not follow this tradition of 'jump dimming'.
Lights on a ship are typically dimmed for a period of about two minutes; the lights are brought back up to full strength as soon as the ship is in jumpspace.

Jump Drive
The key to the stars is the jump drive: an almost magical technology that shifts a ship through a tear in the fabric of spacetime into an alternate universe where the generally accepted laws of physics don't apply. 
RealSpace limits travel to the speed of light (and to years of travel between stars); jump drives propel ships between stars in a matter of weeks. A simple jump covers a parsec (3.26 light years) in about a week. Improved drives can reach up to six times that speed, or more.
Nevertheless, Jump Drive has its drawbacks: requirements for (literally) tons of fuel, specialized power sources, and careful astrogation, all of which challenge the players as they pilot ships from world to world. 
A Jump Drive creates a Jump Field which drags the ship tonnage within it into Jumpspace. The Jump Field can be expressed as a jump bubble surrounding the ship, or as a jump grid closely conforming to the ship's hull.
Jump involves some logical disconnects: vast amounts of power are required to transition to jump space, but almost no power is required to move through it; the time spent in jump space has little or no relation to the distance travelled; and sometimes, jumpspace does not operate in logical or predictable ways.
Jump drive technology is widely accepted as an indicator of social as well as technological power. It is also rare. Based on the historical sample of Charted Space, only one technological sophont species in 400 independently develops jump drive technology. Astrographically, jump drive technology develops about once in 20 to 40 sectors.
Jump is possible because of Jump Space: an alternative space where the laws of physics of Real Space do not apply. Jump Space is truly alien: it is antagonistic to life and in some ways even to matter; time flows differently; distance is also strangely different. Only the jump field protects a hull and its contents from immediate destruction.
Entering jump is possible anywhere, but perturbations due to gravity make it safest to begin a jump at least 100 diameters out from a large massive body such as a world or star. Ships are naturally precipitated out of jumpspace before they get too deep into a gravity field.
Normal jumps take 168 hours (plus or minus 10 percent) to complete, regardless of the distance travelled.

Jump Inducer
Turret weapon. The Jump Inducer channels the energies of a ship's Jump Drive into disastrous jump-like effect on a target. TL 17.
The name Jump Inducer is misleading: the weapon induces a misjump of components of a ship. The misjump essentially disintegrates the components.
A Jump Inducer requires an installed Jump Drive.
Tags: defense.

Jumpspace Institute
Originally established at Deneb to investigate interstellar jump drives. Financed initially by the Duke of Deneb, the institute has since become an arm of the sector government. Projects include training for starship engineers and naval architects.

Jumpstart
Public works project initiated by Emperor Strephon.  It was intended to provide an influx of capital to certain selected planetary economies to create new jobs and promote economic growth.  The funding came from numerous Imperial agencies, which were encouraged to spend discretionary development funds on projects of public value, such as libraries, schools, and museums.  By using a wide variety of agencies to provide planning and funding, such as they Navy in a system which already had a naval presence, or the Scout Service in a system which contained a way station, administrative overhead and duplication of effort was kept to a minimum.

Jump Troops
Specially trained units assigned to planetary invasions. They are lightly-armed infantry, generally equipped with battle dress and whatever support weapons can be man-carried.
See also Drop Troops.

Kaarike University
Institution on Vland, part of AAB.
See AAB.

Kedzudh, Commonality of
Loose interstellar government in the Vargr Extents. The Commonality dates from 1044, when several world governments joined in an attempt to suppress piracy. The Commonality government has limited powers of taxation; government institutions include a small navy/police force and a university. Individual worlds conduct their own interior and exterior relations.

Kforuzeng
The most powerful Vargr corsair band in Gvurrdon sector. from 1105 to 1107, it virtually monopolized all corsair activity along most of the length of the Domain of Deneb border. It remained the largest band even after severe decline. The Kforuzeng has a reputation for extreme ruthlessness.

Khosaa Frigate
QSP G-DL71. Aslan starship. The Khosaa is a short-ranged frigate designed by the Ktya'ea clan. Originally having a Jump-3 engine and intended to be a marauder or supply line cutter, it proved more useful in a group; but it either had too little armor or not enough weaponry to be effective as an escort. Finally it found its niche as a quasi battle rider, carried in squadrons by a Tuileaye transport to its destination. It retains a minimal jump drive to allow it to prowl along mains.
It sports the Ouai L-132B jump drive, the Yuaii Impulse z7 maneuver drive, and the Kteweioa 0812.gH7 power plant, and is capable of Jump-1 and 7G acceleration. Fuel tankage supports 3 weeks of operations OR 1 week of operations and one jump-1 (just enough fuel to escape in an emergency). On the bridge is a computer Model/5.
Tags: Starships.

Khu Su'Ikh
Aslan sector-wide corporation. Khu Su'Ikh maintains a benevolent monopoly of rift passage service through the Riftspan Reach sector.  Its name, which means Five Shields, refers to the five major worlds across the rift. 
     Its fleet includes large cargo carriers capable of jump-5. The company makes its profit from repair and supply services on world within the rift. It provides navigation information for other ships crossing the rift. Its even handed treatment makes rift crossings relatively safe.
     Soon after the jump-5 route was discovered in -1044, the Wahtoi clan staked a claim to many worlds in the sector. Naturally enough, a trading company tied to the Wahtoi soon monopolized trade across the rift. About -750, the Aroaye'i established itself as the dominant clan on Aulryakh, the route terminus. After several years of clan warfare, the Wahtoi accepted the Aroaye'i as partners. The two clans are equal partners today.
Tags: history company aslan.

Kirur (Ruupiin/Thirty 1315 B863A03-F)
Homeworld and capital of the Two Thousand Worlds — the interstellar empire of the K'kree. The planet's oceans are extremely shallow and the world exhibits almost no volcanic activity, which is very unusual for a world of its size. Kirur has one large continent, which was conquered in prehistoric times by the current ruling clan; Kirur is one of the most politically stable planets known.

K'kree
The K'kree (once called Centaurs by humans) are among the most massive of the major races and are the only one of the major races to be descended from herbivores. An adult K'kree stands about 1.5 meters at the shoulder and between 2.0 and 2.4 meters tall when standing erect. Weight averages 550 kg. They are bilaterally symmetrical, hexapedal, and homeothermic. They bear some resemblance to the centaur of ancient Terran myth, a trait noted by the earliest human explorers.
The arrangement of the manipulative organ (or hand) on the front limb is one of their most interesting features. Complex cartilaginous tubes permit the fingers of the K'kree hand to telescope out of the way when the hand is used as a weapon. Fully extended, the fingers are mutually opposable to each other and to the "thumb" which is in reality an extension of the ulna. The K'kree hand is very flexible but somewhat weaker in grasping power than a human hand.
The K'kree are covered with short gray or black fur and a dense black mane covering the head and neck and upper back of both sexes. Unlike Terran mammals, the young are fed partially digested, regurgitated food instead of milk. Males average 15 percent to 20 percent larger than females.
K'kree are extremely conservative in all aspects of their culture. Ceremonial military units (such as bodyguards) are armed with equipment which K'kree military technology outdated centuries ago, and (aside from modifications made necessary by the discovery of space flight) K'kree government has not changed significantly in centuries.
Because of their origins as plains-dwelling herd animals, the K'kree are claustrophobes; they cannot stand to be enclosed. K'kree cities are clumps of low, broad buildings; the interior is never more than one story in height, which allows the sky to be visible. Internal building divisions are achieved with curtains and tapestries.
K'kree are extremely gregarious. They are never found alone, and will quickly sicken and die if removed from other K'kree for any length of time. Receiving a trade or diplomatic delegation from the K'kree means entertaining the entire family (one or more wives, servants, scribes, assistants, etc.) of the merchant or ambassador. The K'kree word for "my" refers to a possession of an individual's herd, not to that of an individual. Privacy and individuality are exotic and little understood concepts for K'kree.
Society: K'kree society is divided into castes. The system is a remnant of ancient times which no longer fits K'kree culture perfectly, but the K'kree stick with it because it is traditional. There are hundreds of castes, but distinctions are too faint for non-K'kree to understand. For simplicity, castes can be divided into three general groupings: noble, merchant, and servants. It is possible for a family to rise in caste, but this is a rare occurrence.
The lowest caste, the servants, has come to include farmers, factory workers and unskilled laborers as well as servants for all classes.
The next higher caste, the merchants, includes most skilled workers, scientists, engineers, technicians, scribes and government administrators, as well as merchants and businessmen.
Nobles are the governmental officials (the Krurruna and others), the high military officers, diplomats, and heads of trade and manufacturing concerns. Nobles are usually garbed in much more ornate fashion than the lower castes.
Every male K'kree must serve a term in the military upon coming of age. Warriors are drawn from all castes; rank in the military is determined by caste of origin. Upon completing the required term of service, a warrior returns to his original caste and position. Warriors are the only K'kree permitted to bear weapons, and they are further distinguished by their peculiar flared and horned helmets. They serve as soldiers, police, firefighters, and bodyguards for diplomatic and mercantile expeditions.
Female K'kree are casteless, and take on the caste of their father or husband. Females have no position in government or society other than the rearing of young.
Government: The basis of K'kree government is rooted in the traditional herd system. The basic unit of government is the herd, which consists of thousands of individuals of all castes and ages led by Krurruna (literally: bosses) under a single steppelord.
In recent times, most herds have been assigned specific geographic areas (several may be assigned to city or a single herd may be assigned millions of hectares of farmland). A number of herds are governed by a single "lord of steppelordes" (usually the ruler of a planet); and the K'kree race as a whole is ruled by a "Steppelord of the 2000 Worlds".
Tags: sophont.

K'kree Calendar
The K'kree calendar is based on the period of Kirur (the K'kree homeworld) around Gzang, it's star. The K'kree Pim!bigr (year) is 439.56 standard days in length. 
See also Kirur, Two Thousand Worlds.

Kuiper
Simplified from Kuiper Belt. Synonymous with the outer reaches of a star system. Example usage: “We went to the Kuiper” or even “We went Kuiper.”

Kusyu (Dark Nubula/Kilrai' 1919 A876986-E)
Homeworld of the Aslan race and capital of the Aslan Hierate.
See Aslan.

Lab Ship
QSP L-DC12. Using a 400-ton TL15 Cluster hull, the laboratory ship is a mobile base for scientific analysis and investigation. It mounts drives for performance of jump-2 and 1-G acceleration. Fuel tankage supports a single jump-2 and five months of operations. Installed on the bridge is a model/2 computer, and a powerful sensor suite. 
The unusual hull of the lab ship allows spin-generated centrifugal gravity: to avoid the interference that gravitics might produce on some sensitive experiments.
About half the ship is allocated to laboratory space and sample storage. The ship has four hardpoints, but no weapons are installed. There is one 40-ton pinnace in a vehicle bracket, and two air/rafts stored adjacent to cargo. The ship is an overtonnage design, which would affect it if it were capable of entering an atmosphere (which it isn't). The laboratory ship requires a crew of five: pilot, astrogator, two engineers, and medic, although most are typically mission-oriented researchers as well. Gunners and scientific research personnel may be added. There are twenty staterooms and no low berths. The pilot operates the pinnace; the engineers operate the air/rafts. The ship can carry 20 passengers (35 if double occupancy) on a non-commercial basis. 
Tags: Starships.


Lair (Provence/Grnouf 2402 A8859B9-F)
"Homeworld" and capital of the Vargr Extents. Lair has never been accorded any particular status in the hearts and minds of the Vargr race, unlike worlds like Terra, Vland, Zhodane, Kusyu or Kirur. Lair was only recently united; several sections of the planet boasted independence until only a few years ago - which is unusual for the home world of a major interstellar race.

Lancia
Cultural region in the Gushemege sector of the Third Imperium. The area was extensively ravaged during the Vilani Pacification Campaigns and afterwards resettled from the Vland sector under a special program sponsored by Makhidkarun.

Lanthanum
A rare earth element, the first of the inner transition metals. Vital to the construction of the inner coils of interstellar jump drive units. Rare Earth Elements are a series of metals which are vital to sustaining interstellar technologies. After being mined, they are separated from one another and processed to the high degree of purity that takes their intended end use into consideration. The complex combination of mineral resources, extraction and refining process, and worker skill is what makes them "rare."
Another challenge to the rare earths business is the supply chain. Rare earths feed the interstellar high tech industry, and supply chains from mine to manufacturer can include as many as 12 jumps along the way. So, for example, if you were to follow the dozen or so different rare earths metals that are in each PowerPlant or Jump Drive all the way back to the mine, you'd have an extremely hard time doing so. These lengthy supply chains get very complicated very quickly.

Laser
Turret weapon. Fires concentrated light energy in beams or pulses against enemy targets and cause damage to exterior surfaces. Pulse lasers fire short bursts of energy at targets, and are more effective at inflicting damage than are beam lasers. Beam lasers fire continuous beams of energy at targets, and are more effective at hitting than are pulse lasers.
Tags: defense.

Leenitakot
The Ancients created a ringworld in the Leenitakot system of the Hinterworlds. Their approach to building a ringworld puzzles the experts. It circles a dim M1 V star at less than 30 million kilometers. The ringworld is a narrow band less than 100,000 kilometers wide, and the construction looks unfinished, without soils, atmosphere, or any provision for life to live on its inner surface. And even so, this small ringworld has an inner surface area equal to 25,000 Terras.
Tags: ancient.

Lesser Rift
Broad Expanse of space with a very low density of stars trailing the main region of the Third Imperium. This rift is a pronounced impediment to interstellar travel, for it constrains jumps through the Empty Quarter.  The Lesser Rift is lesser only when compared to the larger, more prominent Great Rift spinward of the Imperium.
The Lesser Rift, like the Great Rift, has provided long term security for the Third Imperium by constraining access to the Imperiums Boarders.
Tags: astrography.

Leviathan Merchant Cruiser
QSP R2-TB43. Designed jointly by Bilstein Yards of Glisten and the Baraccai Technum, the Leviathan class was developed from previous designs and is primarily intended for independent cruising in undeveloped trade areas; high survivability is also a design factor. The vessels are braced, allowing skimming refueling maneuvers as well as landings in types 0 and 1 atmospheres. Atmospheric landings are otherwise impossible, hence the large complement of ship's boats. 
The ship has one Torgee PL FS62-Y fusion-linked power plant driving two Gayle Field type 77X jump drives and one Bilstein Arg-6Y impulse maneuver drive, permitting a Jump-3 and 4G maneuver. It employs Ganged Forelle Field generators, with 1G floor fields, and has a Zahinyo 7.4 Model/4 computer with integral fiber optic backup.
The sensor suite is extensive, including barbette-mounted EMS and Neutrino sensors.
There are two dual barbette particle accelerators, one each dorsal and ventral. Four remote dual beam laser turrets, two each fore and aft. Four nose launch missile tubes, with drone RPV capability. Six additional hardpoints are available.
The Leviathan requires two shifts of crew, for a total of 46. The ship sleeps 36 crew and 10 squads of ship's troops: the troops man the guns. Up to 4 passengers can be carried. There are six low berths. 
Carried craft includes one 95-ton shuttle, one 40-ton pinnace, two 20-ton lifeboats, in hangars, and one enclosed Air/Raft, in cargo.
Tags: Starships.


Library Data
Library data entries represent information available from any ship's computer using the library program, in response to the correct keywords. The information may be desirable as background or supporting information for an adventure, as data to help players better understand the situations they are in, or as leads to help start new adventures. In general, the referee can look into library data any time the player characters indicate that they are researching a subject. In addition to directly relevant information, additional materials of interest may be revealed to them.
Tags: general.

Lighter
Spacecraft greater than 100 tons displacement, with performance of 3G or lower, designed to land cargo from orbit onto planetary surface.

Ling-Standard Products (LSP)
Originally a mining firm (and still very active in that field), LSP currently engages in manufacture of electronic equipment, ground and air vehicles, starships and starship armaments, drive systems, power systems, computer systems and software, small arms, and a variety of consumer goods.  Concerned to a small degree with banking, insurance, and stockbrokerage, LSP maintains mining and manufacturing facilities throughout the Imperium and beyond.
Stock Ownership: Imperial family, 8 percent; Hortalez et Cie, 26 percent, GSbAG, 23 percent, noble families, 8 percent; Murdoch Holdings, LIC, 8 percent; other, 27 percent 
Tags: company megacorporation.

Llellewylolly
Sophont race native to Junidy (Spinward Marches/Aramis 3202 B434ABD-9). Llellewyloly have five multi jointed limbs which function as hands and feet interchangeably; main sensory organs are also located on the limbs. The spherical central body is covered with long, coarse hair. Many body features are adaptations to the extreme temperature variations of Junidy's day.
Llellewyloly have a complex society with many dimensions of social precedence; the same individual may be entitled to high status in one situation and low status in another, and to make an error concerning propriety is a serious matter.
LLELLEWYLOLY LANGUAGE. Modern Hulloyuo-co is a synthetic language, trilled and whistled by the Llellewyloly in and around the Republic of Regina. Nouns can serve as predicates, so acceptable structures include S, SO, O, and VSO. It is also pro-drop: subjects are typically not overtly expressed when they are inferable from context. Therefore, V and VO are also valid sentence structures. Adjectives precede the noun (big house), while possessive constructions follow it using the multipurpose article col (e.g. uleou col-cy, “my house”, literally house-of-me).
So the sentence structure of Hulloyuo-co is [V]-[S]-[O].
Verb morphology is structured around a basic contrast of aspect prefixes and tense suffixes grouped with an imperative. A number of particles on either side of this stem further modifies the verb.
Tags: sophont.

Loeskalth
Minor human race from Gushemege sector; known only from ancient First Imperium records. During the early stages of the First Imperium the Loeskalth culture absorbed a great deal of science and technology indirectly from the Vilani and founded a small empire which embraced, at its height, most of their home subsector.
About 5400 years ago, the Vilani consolidation destroyed the Loeskalth Empire and absorbed the civilization into the mainstream of Vilani culture. An aggressive and warlike race, the Loeskalth resisted but were ultimately overwhelmed.
Tags: history.

Long Night (-1776 to 0)
The period of interstellar decline and anarchy between the fall of the Rule of Man (also known as the Second Imperium) and the establishment of the Third Imperium by Cleon I.
Tags: history.

Longboat
Any small craft between 20 and 99 tons with long-endurance accommodations for all crew and passengers.

Longbow
Acronym for "Long Baseline Observation Window".  Project name for interstellar communications system begun in 588 Imperial under auspices of the Imperial Navy.  Interrupted by the Civil War (604-622), the project was never successful, and was abandoned and replaced by the successful xboat system established in 624, under the control of the Imperial Scout Service.
This project was recreated in the 800s for observation of the galactic core and the Zhodani axis of exploration toward the core.  The largest known application of aperture synthesis ever constructed, Project Longbow was a deep Imperial secret throughout its existence, but has since been declassified.  Longbow was created to observe the Zhodani core expeditions, and, after many decades of data accumulation and calibration was actually able to measure Zhodani shipping activity along the core axis.  Because sensor signatures propogate at the speed of light, the observations were not in real time.  Rather, the deeper into the core the sensor "looked", the older the signatures.
The Longbow collector plane was located in the Depot/Lishun (1219 Lishun) system as part of the sprawling Imperial Navy facility there, aiding in its concealment.  The collector plane was a disk of billions of linked receiver elements 26 billion miles in diameter.  This collector yielded a resolution at 1500 parsecs of 10 meters in long-wavelength infrared, and of half a meter in visible light (meaning that objects larger than 5cm in the smallest dimension could be detected, and two such objects more than 5cm apart could be distinguished as two objects).  According to the Imperial Navy public relations office, the collector was dismantled when the project was shut down.

Lucan (b.1088)
Prince of the Imperium, son of Princess Lydia and Duke Dresden, the younger of Emperor Strephon's twin nephews. Born five minutes after his brother Varian, and so fourth in line to the throne.

Lydia (b.1052)
Princess of the Imperium, daughter of Emperor Paulo III, sister to Emperor Strephon. A naval officer, Princess Lydia carries out many of the formal duties of the Imperial Family with regard to the Imperial Armed Forces. She and her husband, Duke Dresden, also tour Naval facilities throughout the Imperium, presenting decorations and nobility patents on behalf of the Emperor. Born three years after her brother, the Princess is second in line to the throne.

Main
A grouping of systems forming a chain of worlds all reachable by jump-1. This grouping provides a sort of "corridor" allowing jump-1 capable ships to travel to any world along the chain without ever exceeding jump-1.
Many such groupings exist in the Imperium. Prominent examples include the Spinward Main in the Spinward Marches, the Vilani Main centered in the Vland sector, the Sylean Main in Core sector, and Antares Main originating in the Antares sector.
Tags: astrography.

Mainworld
Also Main World. The most important planet or satellite in a system. It has the largest population, the dominant local government type, and the system's starport. Most trade, commerce, and travel deal with the main world.
Tags: general.

Maghiz
The destruction of Darrian technology in -925 by the super-nova of Darrian's sun, Tarnis. Rumors claim that the Darrian's triggered this nova with their advanced technology. See also Darrian.
Tags: history.

MagnetoDynamics
Established in 1040 with an Imperial charter and a mineral exploitation grant for Fulacin (Fulacin/Rhylanor 0203-A674120-D) from the Emperor. The corporation holds several patents for the recovery of precious and heavy metals from atmospheric and oceanic suspension, and originally obtained its position on Fulacin for the use of these properties.  The MagnetoDynamics patents are high technology items, and the overall tech level for the corporation and its settlement at the starport is D, higher than average within the Imperium.
Local inhabitants of Fulacin are all corporate employees, dependents, or contractors. Local government is similarly in the hands of the company, which enforces reasonable regulations for the protection of its exploitation grant and of the locals.
Following the severe economic downturn associated with the False War (1082 to 1084), the company encountered a cash slowdown, and suspended operations for a period. In 1089, an influx of capital allowed the company to resume operations. In partial support of this new era, the company also established a large starport facility (currently typed as class A, minus) with construction and overhaul facilities to 10,000 tons. Completed in 1099. 
The starport facility, envisioned as ultimately supporting mineral export traffic, has served an interim purpose of supporting (through landing fees and other income) the on-going survey of the world for ultimate exploitation. 
MagnetoDynamics' exploitation grant expires in 1199, with a renewability clause for an additional 100 years upon demonstration of efficient and profitable operations. 
Stock ownership in the company is divided approximately as follows: spinward nobility- 8%, Imperial Family- 2%, large corporations- 34%. investment trusts- 46%. public (individuals)- 8%.
Secrets: shortly after the Fourth Frontier War, the Zhodani Consulate realized that they needed an advanced base to support the reduction of Rhylanor. They bought into MagnetoDynamics through some dummy companies, and have placed their own personnel in key positions.
Tags: company mining.

Major Race
An arbitrary distinction based on the achievements of a specific intelligent race. A race which achieves interstellar travel (jump drive) through its own efforts is classed major; one which does not is classed minor.
To date, generally accepted major races include Humaniti, (Zhodani, Solomani, and Vilani, but not other examples), Aslan, the Hive, K'kree, Vargr, Ancients, and Droyne.
The Suerrat (a human race) are considered minor because their achievement of interstellar travel utilized generation ships. Similarly, the Geonee were originally thought to be major race, but their development of jump drive was based on recovered Ancient artifacts rather than on true racial efforts. The Geonee dispute this prevailing opinion and hold the (generally unshared) view that they are of major standing. The Droyne have been demonstrated to be major, for they have developed jump drive as far back as -7000.
See also Aslan, Droyne, Hiver, K'kree, Human, Vargr, Zhodani.
Tags: general.

Makhidkarun
The origins of this company are shrouded in the mists of the Long Night. All that can be stated with certainty is that its foundation pre-dates the Third Imperium. Makhidkarun specializes in the communications and entertainment industries. The firm produces fine musical recordings of all types, two and three dimensional motion pictures, books, magazines, and art reproductions of all sorts. Its communications division produces a wide variety of data processing, storage, and retrieval equipment and the requisite software, along with various innovative robotics technologies. A gourmet foods division trades in all manner of rare and expensive foods, wines and delicacies. In the Spinward Marches, Makhidkarun has manufacturing and purchasing facilities spread throughout the sector, and also has extensive holdings through its transport subsidiary, Arean Transport. This line's routes travel across the sector and beyond into Foreven and Far Frontiers sectors; its starships (including the famous liner, King Richard) are renowned for their luxury.
Stock ownership: Imperial family- 5%, Noble families- 28%, Hortalez et Cie- 28%, Investment trusts- 25%, Private ownership- 14%.
See Megacorporation.
Tags: company megacorporation.

Marches Auxiliary Naval Service
In a border area such as the Spinward Marches, the IISS is responsible for exploration and survey in all the surrounding sectors. Thus, the mapping services provided to the navy in other areas of the Imperium is not up to standard in this area. To deal with this problem, MANS was established. Staffed by people from every type of service background, the Service carries out various survey, exploration, and reconnaissance missions, with a greater emphasis on the military importance of the information gained. The Service also provides several specialized scout squadrons to the Navy during war time.

Margaret
Duchess of Delphi, first cousin, once removed to the Emperor Strephon. Margaret lives far from the social whirl of Capital, preferring the position of sector duchess at the head of the local hierarchy, instead of competing with nobles of similar precedence at the Imperial court. She recently married Count Blaine Trulla Tukera, assuring her of wealth and him of influence, and placing them at the pinnacle of society across two sectors.

Marines
Units normally assigned to squadrons or fleets to give them a military reaction capability. They are under navy jurisdiction.

Marquis of Aramis
Title granted in 631 by Empress Arbellatra to Marova hault-Hayashi in recognition of her services to the Imperium in the Second Battle of Zhimaway. The current Marquis, 19th of the line, is Leonard Bolden-Tukera. The Marquis is titular head of the world government of Aramis; he owes direct fealty to the Count Known of Celepina. The Marquis is marries to the Lady Ariane Tukera, heir to a large block of Tukera Lines stock. They have no children.

Mars
Popular term for the Mars Shipwrights, Gravengineers and Computertechs Union, a shipbuilding concern based on Mora (Mora/Spinward Marches 0704) and owning subsidiary yards on Maitz and Pallique. Named for its founder, Marcus Alexander Rameo Seripando, and the three major industrial unions amalgamated at its formation. In its earliest days, it concentrated solely on merchant vessels, and is widely considered responsible for the success of many Moran based merchant trade companies across the sector. Although the home yard on Mora caters almost exclusively to naval and scout construction contracts, the two auxiliary shipyards still produce merchants as a large proportion of their total output. Many of the Subsidized and Free merchant operations in the Marches use Mars vessels.
Tags: shipbuilder shipyard.

Mayday
Corruption of a Terran term from an ancient language from that world. Accepted in the Imperium as a distress signal for vessels in difficulties. See also SOS and Signal GK.

McClellan Factors
One of Baraccai Technum's two main rivals, McClellan Factors is another giant cartel who had cornered the market in District 268, an independent subsector, after a long and bitter fight between McClellan's and BT (this still causes considerable embarrassment to BT). The main regional McClellan base is at Mertactor/268 (0707), with advance facilities at Trexalon/268 (0509), and, in the Egyrn subsector, Factors are maintained on Walei (0102), Kaldamar (0401). Nabeth (0402), Ashley's Rock (0801) and T'yana (0802). 
Tags: company.

Megacorporation
An extremely large interstellar corporation. When a corporation's scope of operations are such that it provides services to an area similar to that controlled by Imperial government, it earns the name megacorporation. Only thirteen such companies exist within the Imperium, along with another thirteen based in other interstellar states.
Because of their size, megacorporations have truly astronomical numbers of employees, shareholders, and profits. Their upper level executives labor at broad policy questions, and are largely out of contact with the day-to-day (and even year-to-year) activities of the corporation. The real power in the company lies in the hands of the regional managers (under whatever title they have) Who control the actual operations of the business. While they may control only a small fraction of the megacorporation's assets, they wield more power in some areas than do the representatives of the Imperial government.
A small number of Imperial regulatory agencies have power over the megacorporations, and the companies are subject to any applicable local taxes as well. Nevertheless, if Imperial sovereignty is not blatantly violated, regional managers can usually conduct their company' s business as they see fit.
Tags: megacorporation.

Mercenary
Small military units staffed by veterans and available to the highest bidder. They provide their own basic equipment, but employers must supply any special mission needs. Most mercenary units are no larger than companies or battalions.
The remote centralized government of the Imperium is possessed of great industrial and technological might, but it is also unable, due to the sheer distances and travel times involved, to exert total control everywhere within its star-spanning realm. 
Extensive home rule provisions allow planets to choose their own forms of government, raise and maintain their own armed forces for local security, pass and enforce laws governing local conduct, and regulate (within limits) commerce. Defense has been a cooperative effort of local indigenous forces, which is stiffened by Imperial naval bases manned by extremely sophisticated forces.
Conflicting local interests have often settled their differences by force of arms, with Imperial forces looking quietly the other way, unable to intervene en masse. Imperial forces have been unable to operate as a police force so as to not jeopardize their primary mission of defense of the realm. Only when local conflicts threaten the security or the economy of an area have Imperial forces taken an active hand, and then with overwhelming speed and force.
In this environment, the soldier for hire has found active employment. The tolerance exhibited by the forces of the Imperium have made the hired military force a practical matter. Imperial policy has allowed the marketplace to provide military force to those who can afford it; one line of thought has been that a hired military can be more effectively controlled if it gets out of hand, as opposed to nationalistic or politically motivated forces.
1116: The united Imperium stood ready to enforce its own standards; things have changed in the uncertain climate of the divided Imperium, however The basic restrictions against improper scales of force are no longer observed, and weapons such as poison gas or nuclear devices are being used by belligerents Matters have gotten out of hand as each archduke has done what he though was best for the defense of his local realm Imperial forces have attempted to intervene, but the wide-scale nature of the turmoil has diluted their effect and even turned Imperial forces against each other in border areas. 
Tags: general mercenary.

Mercenary Cruiser
QSP C-HS33. The mercenary cruiser is built to carry small military (mercenary) units for corporate or government operations.
Tags: Starships.

Merchant Cruiser
A generic term applied to vessels specifically assigned to independent missions, the prime objective of which is market discovery and acquisition, either in isolation or in competition with other merchant operators. Design parameters for such vessels usually include a high level of weaponry and auxiliary boats in proportion to their cargo capacity and all possible back-up systems, along with high structural integrity.
Tags: Starships.

Meson Gun
Main weapon.  Meson Guns create specialized particles and project them in focused beams at near light-speed toward a target. Specific speed is tailored to promote energetic particle decay beyond any armor and inside the target. The ultimate decay products (electrons and photons) inflict internal damage. TL 13.
Tags: defense.

Meson Screen
The Meson Screen is a variant of the Nuclear Damper: it specifically suppresses the decay of the exotic particles of Meson Gun and CommPlus while ignoring other particle decay. The resulting effect is tailored for a very specific purpose. TL 13.
Meson Screens inhibit the operation of Meson Guns. Meson Screens inhibit the operation of CommunicatorPlus (Meson Communicators) including both transmission and reception. The Meson Screen must be deactivated for a Meson Gun to fire or CommPlus to function. 
Tags: defense.

Mindwipe
Re-Implanting an edited recorded personality of a sophont onto its original brain. TL 15.
The edited personality has been reduced to effectively nothing: all elements of the personality have been removed. The process is reversible: if the original Recorded Personality has been retained, it can be Re-Implanted over the latest Personality implant.
Selective Mindwipe. A Recorded Personality can have selected elements removed (Memories, Skills, even Identity) before it is Re-Implanted. Selective Mindwipe can remove specific memories (for therapeutic purposes, as punishment, or to conceal an identity or ability from Psionic probing).

Minor Race
An intelligent race which has not achieved jump drive through its own efforts. For most races, this classification is appropriate. Many are contacted before they have reached a technological level capable of even considering jump drive, thus permanently prejudicing their potential.
Indeed, the shock of such a classification, and the realization that this classification pervades interstellar society, is sufficient to relegate a race to a permanent role as shopkeepers and accountants. Some slump, while others violently resist the classification. The fact that the categorization is informal and arbitrary, and tends to elevate those already in power has made resistance difficult, if not impossible.
Tags: general.

Misjump
Sometimes a jump goes wrong. Catastrophic failures destroy ship and crew. Other failures can destroy a drive or send a ship in the wrong direction. Sometimes a misjump will reduce a jump-6 to a mere jump-1, or convert a jump-1 into a jump-10, 20, or higher.
Tags: general.

Monadium
Impenetrable bluish-gray metal used as the basic construction material by the Ancients at the site on Antiquity (Corridor/Ian 0816). It has defeated all efforts to determine its exact composition; some experts believe it contains titanium. Even modern tech level 15 plasma and fusion weapons have been unable to penetrate it.

Monitor
A large spacecraft with armament equivalent to a battleship (i.e.  spinal mount, extensive secondary batteries). Used for system defense roles.  Generally a planetoid, and so automatically unstreamlined. Because of the large size, it is very difficult or impossible to move these craft. Like Battle Riders, this craft is in a conquer-or-die situation if facing superior forces. Its deterrent value is therefore fragile as well as powerful.

Moot
The Imperial government's only deliberative body. It has few powers and rarely exercises them. In theory, the Moot includes all Imperial nobles of baronial or higher status, but most nobles do not find it convenient to travel to Capital, and so many of those seated hold proxy votes. Large blocks of these votes can be wielded by a single influential noble.
Technically, the Moot is supreme in the Imperium, but its power is extremely limited. In practice, its deliberations are advisory to the emperor, and he is wise to heed them. The Moot has only one power: to dissolve the Imperium. When this power is brought to bear, it compels compromise between opposing factions.
When an emperor dies, abdicates, or otherwise becomes unfit for office, the Moot becomes important as the validating body for the new emperor. It has the power to examine the qualifications and credentials of the heir apparent and, in unusual situations, to reject him.
The Moot holds its sessions in the Moot Spire, which, at 1.75 kilometers High, is the tallest building on Capital. By tradition, the Spire is the only building allowed to tower above the Imperial Palace, which is 4.25 kilometers away. Elevators with gravitic compensators can speed visitors from bottom to top in 18 seconds. At the top of the Spire is the High Moot, where select committees hold the most private deliberations.
1116: In the resulting turmoil after Strephon's assassination, Prince Lucan ordered the the Moot dissolved for a year in an effort to prevent any infiltrators from convincing the Moot to approve the usurper Dulinor's claim to the throne. 

The Mosaic Desert (Garda-Vilis/Spinward Marches 1118)
A local attraction that seems to be talked up a lot is the Mosaic Desert. Hidden between two mountain ranges on Garda-Vilis' surface, this natural wonder extends over several hundred square kilometers. The desert is a major sight for the adventurous who visit this world. 
Natural geologic processes laid down a variety of different colored minerals in layers on an ancient seabed. Later, seismic disturbances tilted that seabed and allowed a gentle wind erosion to uncover the layers. The result is the Mosaic Desert, endless patterns of brilliant colors. 
Because of high winds caused by the surrounding mountain ranges, access to the desert is usually by land vehicle over rudimentary roads; grav vehicles can be used, but they have to hug close to the ground through the mountain passes. 
The desert is not a disappointment. Its beauty is a wonderful thrill for those interested in beauty; the enjoyment of a vacation in the wilds of the planet pleases the rest.


Naasirka
A Vilani megacorporation of uncertain lineage. Tradition has it that Naasirka was one of several quasi-official bureaus within the First Imperium, controlling under Imperial monopoly large portions of the electronics and software market. 
Naasirka specializes in the manufacture of information storage and processing equipment and software, computers, robots, and other complex electronic devices. Naasirka is the largest supplier of communications equipment to the Imperial Interstellar Scout Service's xboat branch, and the leading manufacturer of robots in the Imperium.
Stock ownership: Imperial family- 4% Investment trusts- 24%, Noble families- 23%, Hortalez et Cie- 11%, Other corporations 14% Igsiirdi family- 13%, Private ownership- 11%.
See Megacorporation.
Tags: company megacorporation.

Naval Base
Port facility for the support, maintenance, repair, and refit of naval vessels. Planetary surface facilities are generally provided for vessels of 1000 tons or less; orbital facilities handle larger ships.
A naval base has several distinct parts to it; each part helps in the accomplishment of the overall mission of the base. The typical naval base is composed of an orbital berthing area, a surface berthing area, a maintenance section, and an administrative headquarters.
Berthing areas provide locations for ships to lay over, for a day or for months. All berthing areas include provisions for refueling from storage tanks or fuel lighters.
Maintenance sections at naval bases vary from base to base. Where such a section would be redundant to the local starport shipyard, it is small, and repairs or alterations are carried out under contract by the local facility. Where adequate facilities do not exist, the naval base itself may have a large maintenance section capable of extensive repairs and refits. Maintenance is performed on ships on the world surface or in orbit as necessary.
The administrative headquarters handles the day-to-day operations of the base, as well as its paperwork (including allocation of funds, distribution of personnel, and disbursement of maintenance and repair contracts). 
The naval base is not a tactical unit. It has no battle forces of its own, and it does not exert control even over local system defense boats (which are under a separate command). The naval base is responsible for supporting the fleet and keeping it in optimum condition for its combat missions.

Naval Depot
Depots serve as focuses for naval efforts: supplying a fleet's every need, providing construction and repair facilities, and producing and testing experimental ship prototypes. A depot generally occupies an entire system. Facilities, material, and personnel are extensive enough to repair and resupply a large fraction of the fleet at any time. A depot may be isolated from outside contact for years at a time without serious setbacks. As depots cover large parts of a system, there is no distinction between orbital and surface berthing.
In peacetime, the main function of a depot is the design and testing of ships. A large staff of naval architects (the cream of the area) and construction personnel is maintained at every depot.
In wartime, depots serve as repair and resupply centers for the fleet. In emergencies, the depot's construction yards are sometimes pressed into service for production of military ships. 
Since a depot is obviously a very sensitive installation, security is tight. An extensive array of both entry and exit codes are employed to ensure no unauthorized vessels enter or leave the system. Contingents of marines and system defense boats are stationed throughout the system, and they are constantly ready for action.
There is usually no more than one naval depot per sector. Depots are placed in systems where they will be close enough to the expected action to be useful, but far enough back to insure that they will not be captured.

Neural Activity Sensor
Remotely detects the electrical activity of a lifeform's central nervous system and classifies it by amount and complexity.  Developed from tech level 12 psionic helmet theory.

Nobility
The foundation of interstellar government within the Imperium. The Imperium depends on nobles ranging From knights to archdukes to carry the chain of authority and the mantle of responsibility from the Emperor to the people.

Nth Interstellar War
Any one of an indeterminate number of inter stellar wars fought between the Terran Confederation and the First Imperium during the Period -2408 and -2219. 
The First Interstellar War (-2408 to -2400) marked the initial clash between Terra and Vland. The peace that concluded the hostilities was both uneasy and short. The second through seventh wars were marked by seesaw exchanges of territory, mostly confined to the Dingir and Sol subsectors. These initial wars were fought, on the Vilani side, with only the forces available to the Vilani provincial governor; central government was preoccupied with other problems. This was fortunate for the Terrans, as Vilani power, even at this late date, was sufficient to crush the Terrans in short order had it been applied.
The Eighth War finally broke open the frontier and ended in the first major Terran victory. Finally, the Grand Imperium took notice, and dispatched major fleet elements to the area, but the time for action had passed. Terran invention of the jump-3 drive made the Ninth War a crushing victory for Terra and forced the Vilani to relinquish most of the Solomani Rim. Thereafter, the Terrans were almost constantly on the offensive.
In the centuries after the conclusion of the wars, no consensus could be reached in the academic community as to when the later conflicts began or ended; all were interrupted several times by armistices, cease fires, or shaky periods of peace (indeed, a new war would often break out along the front lines before the existence of a peace treaty could be communicated to the respective capitals).
Periods of warfare are lumped together or split apart depending on the historian's individual point of view, and a single war to one historian can be identified as two or more wars by others. The situation is complicated by the fact that for some of the years in question are sketchy. To clarify matters, an accommodation was arrived at which simply labels all interstellar wars after the Ninth with the indeterminate N. Proper usage calls for the war to be defined with the actual years being discussed. Many history texts use this system to refer to all the wars except the first.
The Nth Interstellar War (-2235 to -2219) ended the series when the Vilani Grand Imperium collapsed, as much from its own weight, age, and decadence as from Terran victories. The terrans moved quickly to occupy the remaining Vilani territory.
See also First Imperium, First Interstellar War, Rule of Man.
Tags: history.


Nuclear Damper
The Damper Principle creates a volume within which particle decay is suppressed. TL 12.
Fission Is Suppressed. The ND field makes nuclear fission not possible. Fission explosives cannot function. Fission reactors cease activity while the field is active. Radioactive decay stops. 
Hot Fusion is Suppressed. The ND field makes hot fusion not possible. Fusion power plants cease activity while the field is active. Fusion stops. 
Fusion Plus and Cold Fusion are unaffected. 
Matter-Anti-Matter Annihilation is Suppressed. The Nuclear Damper field prohibits the mutual destruction of anti-matter and matter when they contact. Anti-Matter power plants cease activity while the field is active. Anti-Matter Missile warheads fail to detonate (but, they may activate if the field is released).
Tags: defense.

Oath of Fealty
A declaration of allegiance of one world or state to another, often based on common interest or common need. 

Oberlindes Lines
Home Port: Regina. Territory: Regina and Aramis subsectors; Vargr territory in adjacent Gvurrdon sector. 
Established in 1084 with an Imperial charter specifying trade and commerce within the Spinward Marches and supporting distant trade with states bordering the Imperium. Oberlindes is one of the major shipping lines within the Regina subsector, with feeder routes to all major starports; Oberlindes expansion into neighboring subsectors has improved star service but alienated many of the older and more conservative lines. 
The Oberlindes name is an old one in the trade and commerce business in the Marches. Roxanne Oberllndes established the first line to bear the name in 487 and built a family business whlch thrived between each of the several wars which have wracked the Marches In the past half-millenium. The first major increase in Oberlindes' size came in 1049, with the acquisition of Emissary, a surplus cruiser declared excess by the Imperial Navy. This ship, armaments intact, served as the flagship for Oberlindes' excursions into the Vargr Extents on trade expeditions; the venture proved highly successful. A base for Oberlindes was established just beyond the Imperial border (some irregularities in the ship transfer made it impractical to bring the ship into the Imperium) and served as a clearing house for trade good shipments between Regina and the Vargr worlds. 
In the years following the False War, Oberlindes Lines obtained an Imperial charter and began operations with a large fleet composed almost entirely of navy surplus ships - now numbering in the hundreds. The organization concentrates on the smaller feeder routes, but has recently expanded into main line service, in direct competition with Tukera Lines and other more established major shipping lines. 
Sergei hault-Oberlindes, patriarch and controller of the line, was awarded a baronial patent, complete with estates on Feri (Feri/Regina 0405-B384879-B), by direction of the Emperor in 1101 for his contribution to the economic recovery in the Marches following the Fourth Frontier War. 
Oberlindes Lines hires any qualified personnel.  
Oberlindes Lines is a family company with stock ownership divided approximately as follows: Oberlindes family- 78%, investment trusts- lo%, corporate 6 employees- 8%, Imperial family- 2%, and public (individuals)- 2%. 
1105: Oberlindes expanded into the Aramis subsector as a cargo carrier and trader with the Vargr. Oberlindes operations roughly parallel the operations of Akerut. It maintains Aramis facilities at Paya, Violante, Carsten, Aramanx, Nasemin, Towers, Jesedipere, and Lablon. Its main offices for the subsector are at Paya, although they are in the process of being transferred to Aramanx.
Leviathan. Oberlindes owns two Leviathan-class merchants: the Tuembalt since 1099, and the Jakrand since 1107. 
Bloodwell. The 1,000 ton, jump-3 cargo carrier (capacity 400 tons) is a standard design commissioned by Oberlindes, and is reflective of its total fleet. Originally, Oberlindes outfitted his fleet using naval surplus vessels; when the cargo carrier was designed, it also reflected the Oberlindes fleet's predisposition to extensive armament. The Bloodwell was one of these cargo carriers, and generally assigned to the Regina/Regina to Pandrin/Uthe run. It was lost with all hands and passengers to Imperial naval action 347-1105 when mistakenly identified as hostile.
Tags: company interface-line.

Octagon Society
Established in 342, the Octagon Society was the first major distressed spacefarer assistance operation to appear in the Domain of Deneb. The group thrived on public contributions and on some tax revenues for 150 years; then it collapsed in the late 400s when scandals emerged over the quality of shelter construction and the disposition of certain funds. 
Society shelters were generally of an octagonal shape. Large hostels were established on major worlds, while smaller weather shelters were placed on frontier or unsettled worlds. The characteristic octagon-shaped buildings are still visible on various worlds, although none are still in use as shelters for distressed spacefarers.
The Octagon Society was dissolved in 499, and its assets were sold at auction.

Off-dirt Rank
Mercenary jargon for the courtesy title major, applied to non-naval captains when aboard starships, to avoid confusion with the starship captain.
Tags: mercenary.

Olympiad
Common translation of tleqazdijdiet, a Zhodani measure of time representing three Zhodani years (each approximately .75 standard years). An olympiad is used to denote the period from one set of psionic games to the next. The olympiad is used in the Zhodani calendar to mark dates, which are further subdivided by year, season and day.

Oort Cloud
A spherical shell around most stars containing numerous small bodies of cometary material. A typical Oort cloud is about 0.5 to 1 light year from its primary and has an aggregate mass about that of Terra; density is thus extremely low. The main constituents of cometary bodies are ice and dust ("dirty snowballs"). Bodies in the Oort cloud are occasionally perturbed by collisions or by the influence of nearby stars into orbits which pass near the star; these form comets. The Oort clouds are named after the discoverer of Sol's, Terran astronomer Jan Oort.
Synonymous with the remote reaches of a star system. Example usage: “We went to the Oort” or even “We went Oort.”

Outrim Void
Colloquial name for the region to the rimward of the Marches consisting of many small empires and independent worlds. the region is largely unknown to the civilian population of the Imperium, and is regarded with suspicion by the average citizen due to its being a natural haunt for corsairs and any who wish to escape Imperial justice. Many Outrim worlds are believed to have been settled in the great Terran age of expansion known as the Rule of Man, and since isolated from other human contact, whilst others have retained links with either the Imperium or the Zhodani Consulate.

Outworld Coalition
Traditional name for the belligerent groups allied against the Imperium during the First and Second Frontier Wars. Commonly applied to any alliance of powers threatening the Spinward Marches and Imperial territories spinward of the Great Rift.
The original Outworld Coalition was formed in the early 500s at the instigation of the Zhodani Consulate. Vargr allegiances vacillated, but memories of the Imperial campaigns against certain Vargr states in the Corridor swayed some into membership. Zhodani as the major partner, contributed military aid and assistance (such as technicians). While some Vargr governments contributed personnel and naval units, other Vargr remained neutral or sided with the Imperium. The initial history of the coalition was one of continuing struggle for organization, as the Zhodani were continually occupied in establishing Vargr governments, and then maintaining them in power. The intent was for Vargr to raid the coreward edge of the Spinward Marches, especially Regina and Aramis subsectors, while the major thrust from Zhodani took Cronor and Jewell subsectors. The Vargr portions of the offensive failed dismally. Furthermore, the failure resulted in the collapse of the coalition.
The internal Imperial upheavals (the Civil War) which followed the First Frontier War (it was called just the Frontier War then) exposed a continuing weakness in the Imperium, and the Outworld Coalition reformed after a hiatus of five years. At the appropriate moment, the reformed Coalition again attacked the Marches, this time taking portions of Jewell subsector. Although the Vargr again failed to take any territory permanently, their performance as a whole was considerably improved.
Traditionally, frontier wars in the Spinward Marches have involved coalitions of Zhodani and certain Vargr states. the Sword Worlds have also joined the coalition at times.
See also First Frontier War, Second Frontier War, Third Frontier War, Fourth Frontier War.
Tags: history.

Oynprith
Language used between Droyne involved in interstellar commerce. Its origins are not well understood, but it appears to have survived as a formal language for quasi-religious ceremonies. The language is assumed to have been the most common in whatever previous community the Droyne dominated.
Oynprith is a synthetic noun-oriented language with a relatively free word order. Nouns fall into seven genders (and three “exceptions”); adjectives and verbs inflect to agree with their head noun. An odd characteristic of Oynprith is that all nouns are inherently plural (like Anglic ‘sheep' or ‘fish') and have no purely singular form. Even pronouns are plural only.
EXAMPLE TEXT: Syalskolm pyaray nuhholmal mosolmal beyo mosoyal rissoyal nyabeh va vasse. All-people are born free, in equal dignity and rights (in a very formal speech style).
See also Droyne.
Tags: language.

Pacification Campaigns
(76 to 120)
A series of economic, diplomatic and military operations directed at forcing membership in the Imperium upon those worlds which resisted the initial efforts to annex them.
Although the campaigns were predominantly economic and diplomatic in nature, the Imperium was not averse to using force when peaceful methods failed. Imperial battlefleets and ground forces rarely failed when brought to bear.
By 120, the pacification campaigns had ended, and the initial phase of the Imperium's growth came close.
Four specific Pacification Campaigns were undertaken, each by an archduke of the Imperium. The Vilani Pacification Campaign was targeted at portions of Dagudashaag and Gushemege sectors. The Ilelish Pacification Campaign was aimed at the Darmine region. The Antarean Pacification Campaign hit much of Lishun sector. The Sylean Pacification Campaign operated in Delphi and Fornast sectors.
Tags: history.

Pan Galactic Friends of Life
an influential pressure group, concerned with preventing damage to environments by intelligent life. Once considered a member of the lunatic fringe, they gained credibility with their successful defense of the declining herds of dawnsingers. Their most recent major victory was in forcing Seaharvester to accept low quotas for the slaughter of daghadasi.

Particle Accelerator
Barbette weapon. Particle Accelerators project subatomic particles in elec- tronically or magnetically focused beams. Interaction with the target produces physical and radiation damage. TL 11.
Particle Accelerators operate in two distinct modes: in space and in atmosphere. 
Tags: defense.

Patrol Corvette
QSP EB-EA53. Built on a 500-ton TL-13 winged airframe, the Corvette is the Navy’s equivalent of the Scout/Courier, only bigger, faster, and better armed. It is fitted with the Ansar b3-G jump drive, the Yard 7 mL/5 maneuver drive, and the Grid 5p Tokamak/L3 power plant, giving performance of Jump-3 and 5G acceleration. Fuel tankage supports one jump and three months of operations. It has fuel scoops for gas giant skimming. Adjacent to the bridge is a Model/3 computer and an extensive sensor suite. There are five hardpoints filled with an array of powerful weapons.
Tags: Starships.

PDPT-beta
Chemical compound discovered by Seaharvester (now a subsidiary of SuSAG, LIC) scientists in the corpse of a pre-reproductive phase daghadasi (large water animal) some eight years ago. The full name of the compound, Cis-1,2 paradichlorotirethylaminoprocycloheptatrenyl-4-tricyclohexenebeta, is rarely used.
The chemical serves as the basis for a family of experimental broad-spectrum antibiotics which can be selectively "tuned" to wipe out specific types of bacterial, viral, and cancerous growths, while leaving adjacent benign growths untouched. Thus far, no synthesis of the chemical has been produced, and the ecology of the daghadasi homeworld was in danger of serious danger of becoming unbalanced, until the actions of the Pan Galactic Friends of Life persuaded SuSAG to take action.

Peerage
The hierarchy of nobles within the Imperium.

Phoenix Project
Reported plot by Solomani guerrillas on Terra to destroy Imperial forces occupying Terra. Imperial intelligence reported penetration of the project command in 1045, with subsequent compromise of its basic plans and dismantling of its structure. 
The Phoenix Project has supposedly born in the final years of the Solomani Rim War (990 to 1002) as Solomani leaders saw the possibility of their defeat and the loss of the homeworld to the invading Imperials. The project was said to have consisted of two distinct parts: prepositioned caches of Military goods to supply the coming uprising and a continuing program for the training of guerrillas.
The caches were concealed in many different places on Terra in areas calculated to preclude accidental discovery over the years. Each cache contained large quantities of munitions, weapons, vehicles, and medical supplies, all of varying technological levels so as to be of use regardless of the technical knowledge of the users. Each cache was hidden with its location entrusted to a single local family. These families were to form the core of the guerrilla forces when the rising was to take place.
A massive Imperial counter-guerrilla effort in 1040 to 1045 was directed at the discovery and destruction of the caches and the arrest of the families entrusted with the secrets.
Persistent rumors of two additional aspects of the Project — Lambda (a code word to trigger the uprising) and Omega (the reinforcement of the uprising by offworld Solomani) — have been dismissed as baseless by Imperial officials.
Many historians believe that the extent of the plot was greatly exaggerated by Imperial authorities, and hold that it was little more than an extreme example of wishful thinking on the part of the Solomani leadership. At any rate, the Phoenix project no longer threatens the security of the Imperium, if indeed it ever did.
Tags: history.

Planetary Core Energy Tap
The ability to harvest and direct the energy within planetary cores to meet the high energy demands of reality engineering. TL 23.


Pocket Empire
Used to refer to a small coalition of worlds, usually less than a dozen, that are unified under a central government.

Porozlo, Battle of
(980)
The Zhodani thrust (in the Third Frontier War) through Vilis and Lanth subsectors toward Rhylanor met a not unexpected problem - Rhylanor has no gas giant, although it does have a strong naval base to defend it. Neighboring Porozlo (Porozlo/Rhylanor 0305-867A74-A) not only had a gas giant for quick refueling, but also possessed a naval base of potentially great use to invading naval forces.
The battle began with the appearance of a single large Zhodani task force off Porozlo's primary; it proceeded directly to the larger of two gas giants in the system. The local naval base reacted immediat$ly, even admirably, considering that there was no warning of Zhodani approaches this far from the front lines. However, as the first Zhodani task force refueled, portions of it engaged the local defenses, preoccupying them as a second task force appeared and drove straight for Porozlo. The threat of action against the planetary defenses and facilities prompted the world organization to declare Porozlo an open world. Naval forces either surrendered or jumped to safety at Rhylanor.
The fall of Porozlo provided the Zhodani with a supporting base for their seige of Rhylanor. Ships could easily refuel at the gas giant, jump-1 to Rhylanor for raids, attacks, or blockade patrols, and still have enough fuel for jump-1 back to Porozlo, where a class A starport and the captured naval base stood ready to repair any damage immediately.
The naval defenses of Porozlo have been increased considerably since 986.


Postal Union
A group of political units associated to a greater or lesser degree for the purpose of communication among citizens, businesses, and governmental units.
Nearly all star systems are members of one postal union or another. Governments cooperate along their borders in order to allow the efficient flow of communications between them. Members of a postal union forward mail through their territories (subject, of course, to local security needs, acts of War, and so on) to the proper addresses. On the average, communication is at the speed of the fastest available transportation, which typically means three or four parsecs per week.

Proton Screen
The Proton Screen is a variant of the Damper Field: it induces the creation of proton-anti-proton pairs within a volume of anti-matter. Enough of the resulting protons near the boundaries of the containment field disrupt it and force the premature annihilation of the anti-matter. TL 19.
Tags: defense.

Psionics
The criminal use of mental powers for the manipulation of matter and energy and for communication. It has been demonstrated that minds (human or non-human, conscious or unconscious, intelligent or unintelligent) contain some capacity to operate without apparent use of physical facilities. For an individual to seek training in such abilities is a criminal act.
Until circa -1000, psionics was little studied in most regions except on a disorganized level (parapsychology, the occult, spiritualism, and so on). It was known and practiced among the Zhodani and by some minor races, but it was by no means wide spread.
However, during the Long Night, many races, (human and others) turned introspective. As a result, many finally began to engage in serious research in psionics, which revealed much about the empirical nature of the phenomenon, although the principles involved were, and remain, little understood.
Even though it assumed scientific validity, psionics remained a backwater science until about 650, when it underwent a tremendous burst of popularity. Psionics within the Imperium reached its peak in the latter half of the 700s. In the 790s, however, the crest of popular opinion broke with the revelation of scandals within the Psionics Institutes; the result was the psionics suppressions (800 to 826), which shifted public opinion away from support of psionics.
See also Psionics Institute, Psionic Suppressions.
Tags: general psionics.

Psionics Institute
Any clandestine organization devoted to illegal training of individuals in the use of psionics talents. Active Imperial campaigns to eradicate the Institute have been pursued for over 200 years.
Organizations of this nature have existed since before the advent of space travel, but they attained prominence only during the Long Night, when reproducible scientific discoveries made psionics a teachable, learnable science.
In the Imperial antebellum period, psionics institutes were rare, and they were formed only on a few scattered worlds, which for one reason or another, had an unusually high rate of psionics talents appearing, or which encouraged psionics for social, political or commercial reasons. In the years after the Civil War, institutes were organized on most high population worlds within the Imperium. 
“Psionics institute" is a generic name; each such institution was independently organized and maintained. Institutes were generally supported by that portion of the population which had psionic talents; since that portion has small, they were viable only on high population worlds (approximately one billion or more).
During the psionics suppressions, the institutes' charters were revoked, and talented individuals were persecuted. In some cases, the individuals fled to assume new identities on other worlds; in others, whole families emigrated to the Zhodani Consulate or to other places beyond the frontiers of the Imperium.
Following the psionics suppressions, there were theoretically no psionics institutes remaining. In practice, however, illegal underground institutes are rumored to still remain on many worlds.
Tags: general psionics.

Psionic Suppressions 
(800 to 826)
Between 772 and 798, a series of financial, ethical, and moral scandals within the Psionics Institutes of the Imperium shifted public opinion against the institutes. At the same time, it became clear that a good number of the institutes were under the control of the Zhodani Consulate. In 800, the Imperium moved against the institutes by canceling their charters, jailing their leaders, and passing laws restricting the teaching or practice of psionics. Many institute figures went underground to espouse their cause in a type of guerrilla war.
The Psionic Suppressions had a profound influence on Imperial opinion. Over the course of 26 years, the Suppressions equated psionics with the Zhodani and established in the average Imperial citizen a distaste for both which continues to this day. The average citizen will admit to a general dislike of psionics, and if pressed, will usually state that psionics violates a persons right of mental privacy.
Tags: psionics history.

Psychohistory
The science of historical prediction and macrosocial manipulation . The main thesis of psychohistory is that the action of trillions of individuals take on a fluidity and predictability which can be compared to that of molecules in a gas. The very size of the population being dealt with factors out individual peculiarities and allows the prediction of its behavior. With the ability to predict the reaction of a population to a particular stimulus comes the ability to manipulate that population, psychohistorians reason.
Psychohistory began as a combination of public relations/advertising techniques and behavioral science, and although its techniques have been put on a more rigorous footing, the basic principles are still not well understood. A number of minor experiments have confirmed the general validity of the science, but it was also shown to be too expensive to be of practical utility. Research continues at a small number of Imperial universities.

Pyramid
Traditional construction form for developing cultures; considered to be the simplest form of large scale architecture because of its load-bearing strength and ease of assembly. TL 1.
Pyramid structures of all sizes have been believed to serve as focuses for psionic (or cosmic) power, and are claimed to sharpen dulled edges, cure diseases, and generally work miracles.
Pyramids have been constructed on most worlds where the local culture has passed through TL 1. Many examples remain due to the massive strength of the structure.

Q-Ship
A starship designed to lure corsairs by giving the appearance of a weak, poorly-armed merchant ship, but having sufficient combat power to defeat them. They vary from 200 to 800 tons. Since boarding actions are common, ship's boats are specially equipped for troop transport.
Tags: general Starships.

QSP
The Quick-Ship Profile: a summary of the crucial hull and drive elements of a starship.
The QSP consists of five elements: 
(1) The mission code, represented by one or two letters. For example, "A" stands for Trader, "C" for Cruiser, "K" for Safari, "M" for Liner, "R" for Merchant, and so on.
(2) The hull code, which is a single letter representing the tonnage of the ship, where A=100 tons, B=200 tons, and so on to Z=2400 tons.
(3) The hull configuration, which is one of C=Cluster, B=Braced, P=Planetoid, U=Unstreamlined, S=Streamlined, A=Airframe, and L=Lift Body.
(4) The maneuver rating, a number from 0 to 9. (Fractional acceleration is also handled; see T5 Book 2).
(5) The jump rating, a number from 0 to 9 (or higher).
For Drives other than Jump, prefix the Drive. For example, show a 40 parsec Hop Drive as H4 (as in A2-BU2H4).

Quarantine
The act of an interstellar empire interdicting a world from any outside communication or travel.
See Interdiction, Red Zone.

Rachele Society
Secret Vilani supremacist group founded on Pretoria (Deneb/Pretoria 0405) by Zid Rachele in 992. Genocidal policies favored by the group culminated in the attempted takeover of the Pretorian government in 1010. An attempt at nuclear blackmail backfired when 26,000 people (including 1,900 Rachelean commandos) were killed by a nuclear explosion after the Society seized Imperial Scout facilities on Saki (Deneb/Pretoria 0504). Zid Rachele disappeared in 1015 after escaping from the prison world Exile (Deneb/Usani 1928).
In 1103, Zid Rachele and the Rachele Society surfaced again in Lishun in a brief power play at Dynam Naval Depot (Lishun/ Masionia 1219). Rachele and his followers attempted the theft of several mothballed naval warships but were quickly defeated. Zid Rachele's vessel was destroyed in the battle.
Tags: history.

Rachelean Revolts 
(1010 to 1011)
Major uprising on Pretoria (Deneb/Pretoria 0405) fomented by the Rachele Society, which resulted in martial law under the Imperial Navy since that time. The Imperium as a rule does not interfere with local politics, but their intervention was forced when a Scout base on Saki (Deneb/Pretoria 0504) was destroyed by nuclear weapons.
See Rachele Society.
Tags: history.

Rail Gun
Bay weapon. Rail Guns launch a variety of (approximately) one-ton Missiles at strategic world surface and orbital targets. Rail Guns operate in remote regions of a system (planetoids, small moons) where they fabricate their Missiles bodies on-site (hardly more than slabs or billets of nickel-iron) and add guidance systems. TL 12.
Tags: defense.

Ramshackle Empire
Common term used during the Long Night to refer to the Rule of Man, also known as the Second Imperium. As the successor to the First Imperium, the Rule of Man took over the territories (and the problems) of its predecessor. Pro-Second Imperium histories contend that the Rule of Man delayed the inevitable collapse. Pro-First Imperium histories claim that the First Imperium was stagnant, but stable, and that the Ramshackle Empire actually precipitated the Long Night by looting subject worlds and promoting Terran superiority.
See Rule of Man.
Tags: history.

Red Zone
The Traveller's Aid Society travel zone classification for a nation, world or system which is dangerous to travellers. In general, the imposition of a red zone classification indicates the location is quarantined, interdicted by higher authority, or at war.
Quarantine indicates that a dangerous disease is present and the danger of war is self explanatory, but interdiction requires further discussion. Interstellar governments often find it necessary to restrict access to worlds or systems for political or military reasons, and they do so by publishing interdictions.
Enforcement of interdiction varies with the reason for the restriction. Interdiction may be imposed on a world if it is a military base or other sensitive installation, for private reservations belonging to powerful families desiring seclusion, for developing societies which government has elected to allow to evolve in isolation, or for valuable resource areas being saved for later development or exploitation.
Tags: general.

Repatriation Bond
A document guaranteeing passage of an individual to a specified location upon completion of contract work or upon suspension of contract work for any reason. Repatriation bonds are guarantees given as inducements to workers who might otherwise be wary of leaving their own worlds with no assurance that they could return. They are most commonly used by mercenary units. 
Repatriation bonds are usually administered by a large financial institution which holds the necessary funds in escrow.
Tags: general mercenary.

Ringworld
An incredibly strong band could be set rotating about a central star, making a ringworld that uses centrifugal force to provide a simulation of gravity. TL 27.
     A ringworld with a radius of 148 million kilometers and a width of 1.6 million kilometers would have a usable surface area equal to three million Earths. A ringworld of 93 million miles radius and a width of one million miles would have a usable surface area equal to about three million Terras.
Tags: high-tech.

Rosette
Three or more equal masses (such as worlds) which are set at the points of an equilateral polygon.  The correct equal angular velocities about their center of mass will result in a stable orbital configuration; no central star is required.  Rosettes never occur naturally.  The skill and resources required to create such a configuration are available at TL 24.
Tags: high-tech.

Research Station
See Imperial Research Station.

Rubble Field. A hazardous field of planetoids and debris. Often the result of a system-wide catastrophe such as certain kinds of nova. The system's planets and gas giants are often obliterated, resulting in hazardous rubble that has not yet had the time to settle into true planetoid belts.

Rule of Man 
(-2204 to -1776)
Also called the Second Imperium and, disparagingly, the Ramshackle Empire. 
A short-lived interstellar empire formed after the conquest of the Vilani Imperium by the Terrans. The conquered territories were under military rule from -2219 to -2204. Vilani military forces were incorporated into the Terran forces. Terran naval officers took over key posts in the Vilani bureaucracy (which otherwise remained intact).
In -2204, the Terran Secretariat attempted to transfer control directly to Terra and to incorporate the conquered regions into the Terran Confederation. The commander in chief of the Terran Navy, Admiral Hiroshi Estigarribia, realised that the Confederation government could not possibly control the vast territories of the Vilani Imperium. He proclaimed himself Regent of the Vilani Imperium, and protector of Terra, so both states were now united in the Rule of Man. Nearly all the fleet sided with Estigarribia both because it was composed largely of colonials, who were under-represented in the Terran Confederation government, and because of Estigarribia's careful preparation. The Confederation was dissolved without significant resistance.
The Terran fleet headquarters on Dingir became the capital of the Rule of Man. The bureaucratic centre of the Imperium remained on Vland, although arrangements were undertaken to gradually transfer it elsewhere.
Upon Estigarribia's death, he was succeeded by his chief of staff, who crowned himself Emperor Hiroshi II. Estigarribia, even though he did not actually assume the crown, is therefore known to history as Emperor Hiroshi I.
Hiroshi II transferred all functions of government from both Vland and Dingir to a more centrally located world renamed bilingually Hub (Massilia/Ershur 0402). This world was to remain capital of the Rule of Man for the next four hundred years.
During the Rule of Man, large numbers of humans from Terra and its oldest colonies emigrated throughout the Imperium. People of Terran ancestry or culture (many of them assimilated Vilani) assumed positions of power on most worlds and became industrialists and administrators.
The problems of sheer size and scientific stagnation, which had brought about the fall of the Vilani Imperium, continued to plague the Rule of Man. The Vilani had coped with the problems of ruling a large empire by a rigid caste system with all citizens rooted permanently in their places, but this system could only last as long as there was no significant external threat. The Terrans did away with the system but were not able to replace it with a new social order. The destruction of the caste system swept away the foundations of society. Key industries fell apart as their workers became free to move elsewhere.
The -1776 date for the end of the Rule of Man is arbitrary, and it notes the financial collapse of the central government, which occurred when the Treasury at Hub/Ershur refused to honor a monetary issue of the branch treasury at Antares. The resulting lack of confidence within monetary circles marked the end of large-scale interstellar trade and of effective governmental power within the Rule of Man. Although the Imperium did not completely fall apart for many years, the Rule of Man had effectively ceased to exist as a viable interstellar community, and the period known as Twilight had begun.
The Third Imperium refers to the Rule of Man as the Second Imperium, which emphasizes its own roots in the Solomani dominated Second Imperium and the Vilani dominated First Imperium. Anti| Solomani elements emphasize the failure of the Solomani dominated Ramshackle Empire.
Tags: history.

Rule of Terra
Solomani terrorist group active in selected regions of the Solomani/Imperial border. Violently anti-Imperial even by the standards of most Solomani political groups, the Rule of Terra seeks to force the return of all "rightful Terran property" to Solomani hands through assassination and other acts of violence.
The organization, although interstellar in scope, was apparently not a very strong organization in the beginning; some of its claimed attacks have proven to be accidents, while others were the work of different dissident individuals or organizations.
The Rule of Terra's acts, although not its goals, have been disavowed by many other Solomani groups, including the Confederation government; in return, the Rule of Terra has attacked even Solomani populations, stating that "all who do not contribute to the Manifest Destiny of the Race are not worthy to be part of the Race".
1116: Since the death of Strephon and the resulting Solomani incursions into the rimward reaches of the Imperium, the Rule of Terra organization has apparently mushroomed in popularity. The group has claimed responsibility for many terrorist acts along the current Solomani/Imperium border.

Safari Ship
QSP K-SB12. The explorer's yacht. Using a 200-ton hull, the safari ship is an excursion vessel intended for trophy-taking (real or photographic) expeditions to other worlds. It has jump drive-B, maneuver drive-A, and power plant-B, giving a performance of jump-2 and 1-G acceleration. Fuel tankage for 58 tons supports the power plant and one jump-2. Adjacent to the bridge is a computer Model/1 bis. There are eleven staterooms and no low berths. The ship has one hardpoint and one ton allocated to fire control. A double turret is installed; the turret is mounted with twin beam lasers.
There are two ship’s vehicles: an air/raft and a 20-ton launch. Cargo capacity is 6 tons. Two 7-ton capture tanks hold specimens, and two 4-ton lounges are combined into a trophy lounge, serving as a hunter’s recreation area. The hull is airframed, and can be submerged.
The safari ship requires a crew of five: pilot, astrogator, engineer, steward, and medic. A gunner and additional expedition personnel may be added. The pilot operates the launch; the steward operates the air/raft. The ship can carry a party of six (or up to 8 if the crew goes to double occupancy) on expeditions; it does not engage in commercial passenger service.
Tags: Starships.

Saie
"Mysterious non-human civilization" long extinct in Reavers' Deep.
Vanished nonhuman civilization that flourished in the Reavers' Deep subsector roughly 3700 years ago. Evidence of the Saie presence is slim at best: a few artifacts (most notably the starship found at Crash Jura on Glenshiel) have been discovered, and a few ancient Vilani records mention the existence of a small empire of five or six worlds which can be tentatively identified as that of the Saie. Most knowledge of their activities comes from the myths and legends of the Yn-tsai (q.v.) and the Lhshana (q.v.), both races native to the Caledon subsector where the empire seems to have flourished.
From evidence collected, it is believed that the Saie were upright bipeds of carnivore/killer stock. Their homeworld is unknown, and no depictions of their race have come down to contemporary archaeologists intact. They appear to have acquired jump technology from a renegade Vilani governor searching for allies during the upheavals before the Interstellar Wars. The Saie are thought to have been warlike, highly combative, and prove to internal strife; it is believed their presence on any world may have been limited to only a few hundred administrators and soldiers dominating a native planetary population. This theory has been advanced to explain the complete breakdown of their empire and their disappearance from history after an evidently devastating civil war. 
[Ascent to Anekthor.]


Sandcaster
Sandcasters project clouds of sand (small crystalline particles) which obstruct incoming beam weapons. Though installed in a turret, a Sandcaster is not technically a weapon; it is a defense.
Tags: defense.

Schunamann und Sohn AG, LIC (SuSAG,LIC)
SuSAG is involved in a wide range of chemical, pharmaceutical, and genetic engineering activities. SuSAG is the primary manufacturer of anagathics for the Imperium, and maintains psi drug manufacturing plants in client states outside Imperial borders. Because of the bad reputation for safety of its chemical/biological warfare division, the firm is not well liked in many regions, even though all of SuSAG's dangerous manufacturing plants and experimental stations are located on remote, uninhabited planetoids. Since sabotage of its plants is wide spread, and its products extremely valuable, the firm maintains a large paramilitary security force equipped at tech level 12-14 standards.
SuSAG was founded in 252 by Gustav Schunamann, financed from royalties received for his purification process for various psionic drugs, and using the shell of a bankrupt Sylean firm (hence the archaic AG in its name). In 800, psi drugs were declared illegal, all plants engaged in their manufacture within the Imperium closed, and all stocks confiscated and destroyed. Fortunately for SuSAG, the firm had by then expanded into other operations, and although badly damaged, managed to survive and prosper.
In the Spinward Marches, SuSAG has facilities on many industrial worlds. The company supplies a large proportion of the sectors chemical and biological weapons, and owns several isolated laboratories in the Glisten (Spinward Marches/Glisten 2036) belt.
Stock Ownership: Schunamann family- 52%, Imperial family- 2%, Hortalez et Cie- 9%, Other corporations- 24%, Private ownership- 7%, Other- 6%.
See Megacorporation.
Tags: company  megacorporation.

Scout
QSP S-AL22. Using a 100-ton Lifting Body hull, the scout/courier is intended for exploration, survey, and courier duties, with many in service throughout known space. It mounts drives giving it jump-2 and 2-G acceleration. Installed on its bridge is a computer Model/1bis and attack-range sensors. Detached duty versions have an open lounge where survey sensors would typically go.
There are four staterooms and no low berths. The ship has one hardpoint; installed on the hardpoint is one double turret beam laser. There is one ship's vehicle: an air/raft. Cargo capacity is 3 tons. The hull has scoops, bins, and a purification plant for wilderness refueling.
The Scout, by its nature, is built as a one-person operation: a single crew person can handle all operations, albeit inefficiently. On the other hand, the Scout can carry three non-commercial passengers in relative comfort, or up to seven with double occupancy.
More generally, any exploration vessel up to 200 tons might be classified as a type of Scout vessel.
Tags: Starships.

Scout Base
Port facility for the support, maintenance, and repair of scout vessels. The Imperial Interstellar Scout Service maintains a variety of scout bases scattered throughout the Imperium, with installations tending to be on less well-developed worlds with starports type D or C. Scout bases tend to be surface installations equipped with basic facilities for fueling and for minor maintenance activities oriented toward ships of 1000 tons or less.
Scout bases are positioned in systems more out of the way than are naval bases for a reason. The scout bases serve as a source of ships carrying dispatches from the well-travelled Xboat lanes to more remote worlds.
Scout bases also have other responsibilities, and most have an administrative responsibility in addition to the maintenance and refueling of scout ships. Within a subsector, one base will hold responsibility for cartography in the subsector, another will be responsible for technical developments, and still another for contact and liaison activities. 
The scout base is more extensive than an Xboat station, but less comprehensive than a way station.
See Way Station, Xboat Station.
Tags: general.

Se Koez Frigate
QSP G-HS44. Using an 800-ton hull, the Se Koez is a Vargr frigate – a typical small warship used on patrol, military, and anti-corsair missions. It sports the Ghafo L-448R jump drive, the Vaeno Gravitics R4.1 maneuver drive, and the Viraz 4.5R/t power plant, giving performance of Jump-4 and 4G acceleration. Fuel tankage supports 1 month of operations and one jump-4. On the bridge is a computer Model/5.
There are 5 staterooms, 2 spacer niches, barracks, and 5 emergency low berths. Weaponry consists of one particle accelerator bay, one missile bay, a quad turret CommCaster, and two triple beam laser turrets. There is one dual barbette nuclear damper. There are two ship's vehicles: a 40-ton pinnace, and a GCarrier. Cargo capacity is 25 tons. The ship is streamlined.
The Vargr frigate requires a crew of seven: pilot, astrogator, medic and four engineers. Four gunners, two pinnace pilots, and two pinnace gunners are carried in the troops' barracks. Frigates on patrol duty generally carry 12 combat troops for boarding parties in the barracks; with full occupancy, up to 32 troops can be carried when ground fighting or prolonged operations are expected. The ship is not intended for the transport of paying passengers. 
Tags: Starships.

Second Frontier War 
(615 to 620) 
Fought between the Outworld Coalition and the Imperium during the period of the barracks emperors. Arbellatra (b. 587, d. 666) was named Grand Admiral of the Marches and led the combined local and Imperial forces to defeat the Coalition, and then proceeded to restablish the central Imperial authority. 
She was named Regent in 622 as a result, and Empress in 629.
Tags: history.

Second Imperium
The successor of the First Imperium, established by Terran Confederation Navy to rule the territories conquered by the Vilani Empire by Terra.
See also Rule of Man.

Sector
Mapping unit in astrography equal to sixteen subsectors. Average density 500 to 650 worlds per sector.
Sectors are named, and several synonyms are in common use, including march (or marches), region, reach (or reaches), quadrant, and matrix. The Spinward Marches, for example is a sector.
As a rough means of comparing size (and as of 1115), the sector counts of the large interstellar states and areas of settlement are as follows: the Imperium:27; the Aslan Hierate:18; the Hive Federation:17; the Two Thousand Worlds:14; the Vargr Extents:14; the Zhodani Consulate:13; the Solomani Confederation:11.
Tags: astrography.

Seneschal
An aide or executive officer. For high-ranking officials, the wide range of responsibilities of high office are manageable only through computer assistance. Even then, the information flow may be too great. The seneschal is a product of the computer age - an adjutant or assistant with responsibilities in information management. The seneschal has no authority of his own; he manages the massive input of information associated with his superior's position, keeping the official informed, but not overwhelmed.

Sesavetl
QSP EB-FS41. Zhodani starship design. The Sesavetl-class corvette is a streamlined gunship tasked with picket duty in the wilderness. It is faster than the Shivva, with a less armor and fewer smallcraft but better weapons. The class is often deployed well beyond Zhodani borders. Currently assigned to the Egyrn subsector of the Trojan Reach, the Brenzliezhdiafl was the 200th unit produced. 
It is equipped with the Tsopr Systems M12-4u jump drive, the Biafrchtev mM/4 maneuver drive, and the Frietev PL QQ52 power plant, and is capable of Jump-4 and 5G acceleration. Fuel tankage supports 1 month of maneuver in addition to one jump-4. On the bridge is a Model/5 computer. It relies on a 50 ton fuel shuttle to scoop and purify fuel for it (requiring eight skimming runs at a gas giant). The ship carries five craft total: a 50 ton fuel shuttle, and four small fighters. It has 24 tons of cargo space.
The Sesavetl requires 18 crew: an Astrogator, 11 pilots in 8 staterooms, 2 engineers, 3 gunners in 2 staterooms, and 1 medic. There are no passenger staterooms, and no low berths. The astrogator is also a Psionic Adept with Remote Mentation ability, who in addition to normal astrogation duties serves as a Commcaster between the ten fighter pilots. 
Tags: Starships.

Sharurshid
A Vilani trade and speculation corporation, with very little manufacturing capability. Sharurshid trades in luxury goods from all parts of the Imperium and many areas beyond. Most rare Terran wines and spirits are carried on the starships of Sharurshid. Sharurshid is one of the least active megacorporations in the Spinward Marches, although it does own several unique areas and planets with a view to developing products as sought after luxuries. Few Marcher markets are rich enough to afford Sharurshid's prices.
Stock Ownership: Imperial family- 2%, Hortalez et Cie- 29%, Investment trusts- 32%, Noble Families- 18%, Antares Holdings- 19%.
See Megacorporation.
Tags: company megacorporation.

Shivva Class Patrol Frigate
QSP G-FU21. Zhodani starship design. A typical Shivva sports the Chiata M/4 jump drive, the Biafrchtev mF/2 maneuver drive, and the Tobrjde M4+i power plant, giving performance of Jump-4 and 2G acceleration. Fuel tankage of 224 tons supports 2 weeks of maneuver in addition to one jump-4. It has a fuel purifier, but no fuel scoops, relying on a 50 ton fuel shuttle to scoop fuel for it (requiring eight skimming runs at a gas giant). The ship carries 11 other craft: a 50 ton fuel shuttle, and ten small fighters. The Jadsva requires 18 crew: an Astrogator, 11 pilots in 8 staterooms, 2 engineers, 3 gunners in 2 staterooms, and 1 medic. There are no passenger staterooms, and no low berths. The astrogator is also a Psionic Adept with Remote Mentation ability, who in addition to normal astrogation duties serves as a Commcaster between the ten fighter pilots. This class of patrol frigate is an ubiquitous Zhodani Navy design most frequently encountered of the types deployed on and beyond the Consulate frontier districts. The class is often deployed well beyond Zhodani borders.
Sample names (-va = light, thus Shivva = moonlight): Alekrva, Brnava, Doruva, Jadsva, Jirtodva, Loyhva, Mielrva, Shivva, Uturva.
Tags: Starships.

Shriekers
Minor race on 567-908 (Spinward Marches 1031). Their world is known to them as Shvreeyiyi.
Shriekers average 1 meter tall, 1.5 meters long, and mass about 200 kg. All eight legs end in hands, each with two thumbs and two fingers.  Many public and private sign languages exist among Shrieker populations. 
They have three pairs of eyes: a strong ultraviolet-only pair for distance, a close-ranged green-only pair, and an infrared-only pair. Their sense of hearing is acute, enabling them to communicate to one another in standard atmospheres more easily than humans. Nerve pads situated on the palms of the manipulators directly sense nerve pulses in the nerve pads of other Shriekers when in direct contact. The result is the evolution of emotive languages using these nerve pulses; these languages convey subjective content such as opinion, preference, judgment, and evaluation. Their nerve pads also suggest a unique interface to electronic controls and computers; though not a direct interface, it potentially could be faster than human controls, if engineered correctly. 
There are two genders: Egg-layer and Activator. In theory there is a third, Bearer, gender, but Shriekers have adapted or evolved to not need it, and perhaps they no longer exist.
Their spoken language (named Yiirabarhi) is a challenge to humans on three levels. First, it uses different frequency levels, and humans cannot hear much of the sound produced by shriekers, although shriekers can hear human voices. Second, the shrieker nerve pulse cannot be sensed by humans even if in direct contact, and so it is difficult for humans to understand the subtleties of much of what is said by shriekers. Finally, Yiirabarhi is center-embedded with one major grammatical rule: the determinant is embedded in the determined. Adjectives and adverbs are represented by stative verbs; for example, instead of having an adjective for 'red', there is a verb (called a stative verb) 'to be red'.
Tags: sophont.

Shudusham Concords
Agreement signed by twelve worlds of the Sylean Federation at Shudusham (Core/Capital 1821) in -110 which dealt with weaponry carried by robots. The Concords have no legal force now, but many worlds have adopted similar or identical standards using the Concords as a template, and most robots produced commercially in the Imperium are designed with these restrictions in mind.
The Concords consisted of seven articles:
Article 1: Gives a general explanation of the document, overall guidelines for robot construction, locations and occasion of robot use, and the rights of robot owners. The robot's owner is responsible for all actions the robot may perform, whether direct or indirect. Reliability is thus identified as a key issue, as is motivation for a robot equipped with a weapon or used as a weapon.
Article 2: Describes detailed programming guidelines for general functions.
Article 3: Covers detailed manufacturing standards to insure reliability and provide for the safety of owners and the general public.
Article 4: Gives guidelines for when and where weapons are allowed or prohibited.
Article 5: Describes specific programming logic for weapon control and usage. Most strongly worded of all the articles.
Article 6: Describes detailed manufacturing standards to insure weapon reliability, when weapon installation is allowed.
Article 7: Provides for a new agency whose responsibility is to enforce the articles of the Concords.
Forty-three amendments were made over the course of the Concords' active life. The 37th amendment is well-known; it states that no pseudo-biological robot may attempt to pass itself off as a living being.  
A hardcopy of the Concords is on display at the Museum of Sylean History on Capital.
Tags: robots  history.

Signal GK
Abbreviation for Gashimeku Kaalariin, Vilani for "vessel in distress". The code signal GK originated on Vland as a distress signal in maritime and aviation activity, and it was one of the standard communication codes of the Vilani Imperium. When the Second Imperium succeeded it, signal GK was retained as a distress code co-equal with the Terran SOS and Mayday signals.
The Imperial Navigation Act of 103 requires all vessels, whether military or civilian, to respond to the GK, SOS, or Mayday signals provided such a response does not endanger the ship and crew of the responding vessel.
See also Mayday, SOS.
Tags: general.

Six Races
Traditional term for the intelligent races which dominate this region of the galaxy. It appears independently in Aslan, Vargr, and K'kree literature.
There is some disagreement as to the meaning of the term and the identity of the races involved. Most commentators agree that all of the six races must be major races; the candidates are Aslan, Droyne, Hive, K'kree, Solomani, Vargr, Vilani, and Zhodani. Various racially based hypothesis have emerged, but none have gained ascendancy.
Tags: sophont.

Soegz
Admiral Soegz was a loyal supporter of Arbellatra in the final years of the Civil War, and he was elevated to Archduke of Antares by her decree, which incidentally and simultaneously ordered the execution of the previous archduke for the treason or not supporting her.
Soegz, a Vargr and a subordinate admiral under Arbellatra, commanded a task force during the fleet actions of the Second Frontier War and late in the Civil War.
Tags: vargr.

Solomani
Strictly, a member of that human race which developed on Terra from the original human stock (H. sapiens). The term Solomani is often used to refer to members of the Solomani race (or, more palatably to some, to members of the human race of Solomani descent) or to members of the Solomani political movement. Its original meaning is obscure, but the word seems to have derived from either "men of Sol" or "sole men".
After the Solomani developed jump drives in -2431, Solomani humans scattered to the stars in several waves. Early colonization efforts first settled the worlds closest to Terra; the later conquest of the First Imperium and the establishment of the Rule of Man sent more Solomani humans out primarily to occupy former Vilani controlled regions.

Solomani Autonomous Region
Area within the Imperium granted self-government through a charter from Empress Margaret I in 704.
The charter granted control of the region of space within a radius of 50 parsecs of Terra (hence the name Solomani Sphere) to a Solomani governing body, which was given broad powers of authority.
For two hundred years, the Imperium effectively ignored the region and concentrated instead on its coreward frontiers.
By 940, Solomani oppression of non-human (and non-Solomani) worlds forced Empress Margaret II to revoke the region's charter. After years of diplomatic actions proved fruitless, it was decided to forcibly reintegrate the region into the Imperium. Naturally, the Solomani resisted, and the Solomani Rim War (990 to 1002) began.

Solomani Confederation
In 871, the government of the Solomani Autonomous Region reorganized itself as the Solomani Confederation in an attempt to strengthen its claims to the heritage of the old Terran Confederation. Although tantamount to a declaration of independence, the reorganization was officially ignored by the government of the Imperium until the increasingly belligerent and extremist policies of the Solomani caused many border worlds under Solomani rule to petition the Imperium for redress.
The branches of the Solomani Confederation's government took the names of the government of the Terran Confederation, but the present institutions have little resemblance to those of the past. The chief governing body is the Secretariat. The Secretaruiat is presided over by the Secretary General, who is elected from its membership. The Secretary General is the chief administrative officer of the Solomani government, and while the office holds great power, it is fully accountable to the Secretariat.
Representatives to the Secretariat are appointed by the governments of the individual districts. The number of representatives each district may appoint is determined according to that district's contribution to the Solomani economy. 
A district typically consists of a single world, but low population worlds or depressed areas are combined into multi-world districts. In the case of a district such as this, an election is held to determine the representative from that district. These, however, are not elections in the normal sense; the governments vote rather than the populace. Each government of such a district is allocated votes (again, according to its economic importance), which are used to elect a representative for that district.
All government office holders and officials must be members of the official party, the Solomani Movement. Although once waning in power and influence, the party is gaining in popularity as a result of successful Solomani incursions on the Imperium's rimward border. Still, the real power in the Confederation is held by the government and its factions. 
Because of the greater degree of local autonomy that exists in the Solomani Confederation, inter-world factionalism exists to a much greater degree than would be allowed in the Imperium. Coalitions of worlds exist outside the normal government channels, sometimes equalling them in importance within a given region. 
For example, the Near Bootes cluster, in the Capella subsector of the Solomani Rim, dominates large portions of the adjacent subsectors both economically and politically. Bootean mercantile interests heavily favor peaceful trade with the Imperium, and their influence is considered to be responsible for many peace negotiations between the Imperium and the Solomoni Confederation.
Another example of this factionalism is the ongoing trade war between Kukulcan (Kukulcan 0405) and the coalition of Thetis (Kukulcan 0108) and Laputa (Kukulcan 0310). The war is causing severe damage to the economy of Kukulcan, but the Thetis-Laputa coalition has thus far been able to muster enough power to prevent effective intervention by the Confederation government.

Solomani Hypothesis
When the Solomani discovered jump drive in -2431, they also discovered that more than a dozen human races had already colonized the worlds surrounding Earth. At the same time, there was no satisfactory explanation for the more than 40 genetically identical human races.
The Solomani Hypothesis, first proposed by Magis Sergei haut-Devroe (64 to 141), theorized that all of the many widely scattered human races of the galaxy originated on Terra, and he thought that they were transported to their current homeworlds by an alien race (called the Ancients) for purposes which even today remain unclear. The approximate date of the scattering has been established as -300,000.
When Terra was incorporated into the Imperium in 588, a small historical mission verified much of haut-Devroe's work. The hypothesis was already generally accepted by the majority of the human population in the Imperium.
More than 40 known human races have been located (and several more of them failed to adapt to their new worlds and are now extinct); only three of these human races have reached widespread prominence: they are the Vilani, the Zhodani, and the Solomani. 
Most other human races accept the hypothesis but lend it no special importance. The hypothesis is used by the Solomani Movement as a basis for its claims of Solomani racial superiority.

Solomani Movement
An organization devoted to the doctrine that humans of Solomani descent are superior to all others and are most fit to rule the galaxy.

Solomani Rim War 
(990 to 1002) 
War between the Third Imperium and the Solomani Confederation during which a large portion of the Solomani Rim sector was returned to Imperial control. 
Hoping to profit from Imperial preoccupation with the Third Frontier War and the disorganization which followed upon the abdication of Styryx in 989, the Solomani reasserted their control over the complete Solomani Sphere, including those portions reabsorbed into the Imperium (see Solomani Autonomous Region). The Imperium declared war in 990.
The initial phase of the war went very well for the Solomani. Although the Imperium maintained sizable fleets along the border, they were inferior in strength to the massed naval elements of the Solomani Confederation. In most areas, the Solomani regained the border worlds lost to the Imperium in the last half century and even occupied a number of worlds that had never been part of the Solomani Sphere.
However, Solomani fortunes were checked in 993 when a large invasion force attempted to regain the worlds in the Old Expanses sector; it encountered near-fanatical resistance and was repulsed with heavy losses.
The period from 993 to 998 was one of stalemate. The Solomani abandoned their plans for further expansion in order to rebuild their forces. However, their policy of inflexibly defending every border world was a constant drain on their resources, and the Solomani were not able to regain the initiative. By 998, the Imperial Navy had achieved strategic dominance as the greater industrial base of the Imperium made its power felt.
The last phase of the war, 998 to 1002, consisted of a near continual advance by Imperial forces into the heart of the Solomani Sphere. The basic Imperial strategy was to attack along two parallel axes of advance, with lesser task forces spreading out to create a huge pocket of Solomani Territory.
Although the Solomani occasionally achieved a tactical success against a task force (such as in the Battle of Kagukhasaggan in early 1002), they were unable to halt the main advances. With the liberation of the Vegan district in 1001, the Imperium gained the secure base envisioned in the reign of Styryx. The loss of the Vegan district prompted the Solomani to embark on a desperate gamble. Recalling the time when the outnumbered Terran Confederation was able to defeat the Vilani Imperium, the Solomani consolidated their remaining naval forces into a single fleet and struck at the Imperial fleet that was advancing out of the Vegan district. 
At the Battle of Dingir, in early 1002, the Solomani Grand Fleet was scattered and substantially destroyed. The remnants of the Solomani fleet fell back deeper into the Sphere and the Imperial forces firmly established themselves in Terra's own subsector.
The Imperial high command decided that Terra would have to be invaded in order to end forever all claims of Solomani superiority and thus the use of Terra as a rallying standard elsewhere in the Sphere. In order to invade Terra, a sizable fraction of the Imperial forces in the Solomani Sphere were assembled into an assault force, which effectively ended the pursuit of the defeated Solomani fleet. The invasion began in the second quarter of 1002, and the hard-fought campaign lasted until nearly the end of the year. 
In the end, the Imperium conquered the planet. However, the battle for Terra had consumed so much of the Imperial military's resources that the Imperial high command felt they lacked sufficient strength to resume their advance into the rest of the Solomani Sphere. Accordingly, they negotiated a temporary armistice with the Solomani military commanders, who were glad to gain a respite to regroup their remaining forces. The war ended on this basis as both the Imperial and Solomani civilian governments, who were concerned with the strain placed on their economies by the protracted war, informally agreed to extend the armistice indefinitely.
Although scholars have debated the wisdom of invading Terra, some claim that the battle was a marginal if not a pyrrhic victory for the Imperium. The general consensus has been that the war as a whole was a victory for the Imperium. A substantial amount of the Solomani Sphere was reabsorbed by the Imperium, and a vigorous Vegan Autonomous District was set up to oversee Imperial interests along the new border.

Solomani Security
Also known as SolSec. Secret police force maintained in service to the Solomani Confederation for the purpose of maintaining state secrets, conducting espionage, and implementing political policies of the government.
Solomani Security maintains both a network of contacts which provide information from outside the Confederation and a network of informants which provide information within the Confederation. Solomani Security agents themselves are highly trained individuals capable of conducting espionage and sabotage.

Solomani Sphere
The territory governed by the Solomani as the Solomani Autonomous Region. See Solomani Autonomous Region.

Sophont
A generalized term for an intelligent life form.
Tags: sophont.

Sophontology
The study of intelligent life forms. Subsidiary branches of this science include: cultural sophontology, the comparative study of sophont societies; physical sophontology, the study of genetic and physiological makeup of intelligent life; and developmental sophontology, the study of the various means by which life forms evolve intelligence.
Tags: sophont.

SORAG
(Pronounced "SOAR-ag") is a special purposes division of the Zhodani Consulate Combined Interstellar Forces. The name is an acronym for Study and Operations Recording Activities Group. The purpose of SORAG is to observe the progress of emerging interstellar societies using overt and passive means. Most activities of the organization consist of receiving civilian transmissions of various types and recording or cataloging the facts therein. SORAG is a means whereby the Zhodani can stay abreast of changes in the government and technological level of various societies within the Consulate and the Client States. Although employees are paid by a pay scale similar to most military systems, SORAG is not directly affiliated with any military organization.
REFEREES ONLY: The above, gleaned from any number of official publications of the Zhodani Consulate, is almost completely false.
SORAG (Scientific Operations Research and Administration Group) is an intelligence and counter-intelligence service operated by the Colonnade Administrative District (CAD) in Vanguard Reaches to rimward of the Consulate.  Its purpose is to infiltrate and perform surveillance on interstellar governments and military services with which CAD is in contact. Activities within the sphere of SORAG's mission include: guerilla warfare, subversion, sabotage, escape and evasion, "black" and "gray" psychological operations, and other operations best described as unconventional warfare.

Spinward Main
A grouping of systems in the Spinward Marches sector, each within jump-1 of another. This grouping forms a corridor that allows jump-1 capable ships to travel to fifteen of the sixteen Spinward Marches subsectors and to 223 of the sector's 437 worlds.
Tags: astrography.

Spinward Marches
The Imperium's farthest frontier sector, containing 437 star systems divided along a coreward/rimward line by the Imperial border. The region is dominated by two major powers: the Imperial Spinward Marches sector and the frontier provinces of the Zhodani Consulate. In the independent territory between the two powers lie four small territories: the Federation of Arden, the Sword Worlds Confederation, the Border Worlds (a splinter state cut from the Sword Worlds during the Fifth Frontier War), and the Darrian Confederation. Each follows its own diplomatic line designed to maintain independence from both the Zhodani and the Imperium. 
The Spinward Marches has been settled since the 400s and is still a frontier sector. High-tech worlds are scattered among empty, fallow worlds; there is potential for exploration, exploitation, and development for centuries to come.
Tags: astrography general.

Starport
"Every adventure begins and ends at a starport." Starports are the central cross- roads that all interstellar traffic must pass through. It stands to reason, then, that interstellar travellers naturally gravitate to starports... to meet starships and crew, to buy and sell cargoes, and to begin and end their adventures.
Established for the landing, servicing, refueling, and control of starships. Starports range in quality from A (the best and most extensive) to E (the worst, little more than a spot of cleared ground) and X (no starport at all).
Starports generally have two components: a surface facility and an orbital facility. The surface facility includes cargo handling installations, a landing field, control towers, and other necessary areas. Surface starport components are frequently called Dirt-Side, Ground, or Down (as in Credo Down Starport on Regina). Orbital facilities are present (usually in stationary orbit above the surface component) to enable handling of unstreamlined ships and to allow construction of heavy craft in orbit. The orbital component is often called Up or Orbital (as in Credo Orbital Starport). 
Type D and E starports have no extensive orbital facilities, but usually have navigational satellites or similar equipment. Nonstreamlined ships at these starports must be serviced by shuttles. Starports, being the primary point at which starships interact with a system, are usually the location for shipyards and additional bases, such as scout bases, naval bases, or other military and governmental installations.
Tags: general.

Startown
The part of a city which lies just outside a Starport's extrality line, and is the place to find services for crew members on shore leave.
See Starport.
Tags: general.

Sternmetal Horizons, LIC
Sternmetal is primarily engaged in mining operations and manufacturing. It produces mostly power generation equipment of all types including power plants for starships, air and ground vehicles, cities, and industrial installations. Additionally, Sternmetal is the largest manufacturer of food synthesis equipment in the Imperium. In the Spinward Marches, Sternmetal runs a low key operation, and is best known for supplying galley equipment to the sector's smaller ship builders. Various Sternmetal divisions trade under other names, and many individuals are unaware of how often they use Sternmetal's products. The aim of this policy appears simply to reach as many markets as possible with their fundamental trade goods.
Stock Ownership: Imperial family- 2%, Hortalez et Cie- 29%, Investment trusts- 32%, Noble families- 18%, Antares Holdings, LIC- 19%.
See Megacorporation.
Tags: company megacorporation.

Strephon (b. 1049)
Forty-third and current emperor of the Imperium; eldest son of Emperor Paulo III (981 to 1071). Born 1049. Coronation 1071. UPP 768ABF. 
Strephon has been criticized for starting to reverse the post Civil War policy of reducing the power of the archdukes. The most controversial such move was the appointment of Dulinor as Archduke Ilelish, who is considered to have an excessively strong power base. The Emperor has also shown considerable interest in the latest technological developments, particularly in the field of pseudo biological robots.
1116: Murdered by Dulinor in 1116.

Subsector
Mapping unit in astrography. Average density: 30 to 40 worlds per subsector.
Subsectors are noted within a sector by their position using tile first sixteen letters of the alphabet (A-P). In addition, they are named and may be called by a variety of synonyms for subsector, including province, cluster, or district. Imperial convention is to assign numbers to districts (for example, District 268), which are under Imperial protection because they are pending integration into the Imperium.
Tags: astrography.

Subsidized Liner
QSP M-FU13. Using a 600-ton TL12 unstreamlined hull, the subsidized liner is a passenger and freight carrier committed to long-haul routes. It has jump drive-J, maneuver drive-C, and power plant-J, supporting 1 month of operations and giving performance of jump-3 and 1-G acceleration. Fuel tankage of 200 tons supports the power plant and allows one jump-3. Installed on the bridge is a Model/3 and a default sensor suite. The ship has six hardpoints, but no weapons are installed. There is one ship's vehicle: a 20-ton launch, carried in an internal hangar. Cargo capacity is 120 tons.
The subsidized liner requires a crew of seven: pilot, astrogator, three engineers, one steward, and one medic. Up to three stewards may be supported, and up to three gunners may be added in bunks. The ship has 21 passenger staterooms and 20 low berths, and can carry 21 high or middle passengers and twenty low passengers. The pilot operates the launch.
Tags: Starships.

Subsidized Merchant
QSP R-DA11. The Subsidized Merchant is a common sight across the Third Imperium. Built on a TL 13, 400 ton Airframe hull, the ship has Drives and Plant-B, giving Jump-1 and 1G of accelleration. Fuel tankage of 44 tons is provided for one jump-1 and one month of operations. Fuel scoops and water intakes are available for wilderness refuelling. Two hardpoints are available but no weapons are installed.
The ship operates with a crew of 5: Pilot, Astrogator, Steward, Engineer, and Medic. Staterooms are available for up to 8 High Passengers, and there are 9 low berths. Adjacent to the bridge is a Computer Model 1/std.
The lower through-hull deck holds 212 tons of cargo, and landing legs allow both rough terrain landings and raising/lowering the cargo deck to meet loading ramps.
Attached to a streamlined bracket on top of the vessel is a standard 20 ton Launch.
Tags: Starships.

Susa Class Freighter
QSP F-KS13. Using the 1000-ton hull, the Susa is a freight transport vessel typical of the cargo carrier ships operated by Oberlindes lines. It is equipped with the Systems Inc. L-392Q jump drive, the Slipstream Ek.91 maneuver drive, and the Qf-3 Cold Sun power plant, giving a performance of Jump-3 and 1G acceleration. Fuel tankage supports 2 weeks of operations and one jump-3. Adjacent to the bridge is a computer Model/3.
There are 17 staterooms, 10 low berths, and gunner barracks. Its three triple turret lasers are deployable to serve as emergency lifepods; the remaining seven hardpoints are unused. There is one ship's vehicle: an air/raft. Cargo capacity is 417 tons. The hull is streamlined, and has fins to improve its performance in atmosphere.
The cargo carrier requires a crew of 10: captain/pilot, astrogator, 4 engineers, medic, and 3 gunners. The astrogator typically operates the air/raft. The ship can carry 12 passengers and 10 low passengers. 
The cargo carrier is a standard design commissioned by Oberlindes, and is reflective of its total fleet. Oberlindes ships show no consistent system of naming.
Tags: Starships.


Superheavy Elements
Although elements heavier than uranium are increasingly unstable and radioactive (with half-lives measured in fractions of a second), quantum theory predicts an "island of stability," consisting of the elements with atomic numbers 114 to 122, which have half-lives measured in the millions of years. These superheavy elements, also called eka-metals or island metals, are generated in small amounts in supernova explosions. Only a few grams have ever been discovered in nature, which is just enough for scientists to determine that superheavies would be immensely valuable to industry if a source could be found.

SURD 
(Shinku University Research Directorate)
One of the principal robot manufactures in Core sector. SURD was founded about 400 years ago by a group of academic roboticists who agreed to pool their patents, to make robots, and to make money at the same time.
     Today the marketing and fiscal management are left in the hands of corporate officers trained in business matters. No research is actually conducted by SURD itself. Many university robotics departments are patron members of SURD, however, which provides generous research grants in exchange for the right to commercially exploit useful discoveries.
Tags: company.

Survey, First 
(published 420) 
The first comprehensive astrographic and demographic survey of the Imperium, which was performed by the Imperial Interstellar Scout Service. More than a hundred years in the making, its publication in 420 made available the Imperium's records on its component worlds for public use.
Tags: astrography.

Survey, Second
(published 1065) 
The second comprehensive survey of the Imperium, which was performed by the Scout Service, and which updated the long obsolete and incomplete data of the First Survey. The Second Survey was seventy years in compilation, went to greater lengths than the First Survey, and included more world data as well as more complete astrographic data. In addition, the expansion of the Imperium since 420 had added many new worlds that had to be included.
Tags: astrography.

SuSAG
Commonly used name for the megacorporation heavily involved in chemical, pharmaceutical and genetic engineering. See Schunamann und Sohn AG, LIC.
Tags: company, megacorporation.

Sword Worlds Confederation
A loose confederation of worlds in the Spinward Marches, coreward of the Darrians and spinward of Imperial space. The first settlement in the region was on Gram in -399.
By circa -200 the settlement of the area was largely complete, and the first interstellar government in the region, the Sacnoth Dominate, was formed in -186. Consisting of the twenty worlds settled up to that point, the Dominate lasted until 102, when it was fractured by rebellion into several smaller states.
During the ensuing centuries various Sword World governments rose and fell; they sometimes coalesced all the worlds under a single world's domination and sometimes splintered into several small states. Contact with Imperial traders in 73 brought increased trade and had a stabilizing influence on the region, but this stability was short-lived.
The First Frontier war brought a desire for cooperation among the various squabbling worlds, and the end of the war saw the formation of the first unified confederation in centuries, which was centered on Sacnoth and which was referred to as the Second Dominate. As a result of the Outworld Coalition's victory, the Sword Worlds annexed Terant 340, Torment, Trifuge, and Cunnonic, which are all in the Darrian subsector.
The Second Dominate held power until 698, when it was overthrown by a coalition headed by Gram. The Gram Coalition ruled until 788, when a short war with the Darrian Confederation resulted in the loss of the four worlds gained during the First Frontier War.
Public outrage at the mishandling of the war caused the subsequent fall of the Gram government. The replacement was the Trilateral Alliance, a decentralized organization headed by Narsil, Sacnoth, and Durendal. The Alliance broke up in 848 due in large part to the inherent weakness of its organization, and an interregnum of essentially independent worlds lasted until Gram reasserted its influence (helped substantially by Zhodani money and advisers, rumor has it) in 852. This government has retained control-down to the present.
The government allows almost complete local autonomy. Individual worlds maintain separate military forces, pass their own laws, and completely regulate their own internal affairs. The Confederation government regulates inter-world trade, handles diplomatic relations with outside powers, and adjudicates inter world disputes.
In peacetime, the Confederation government maintains a pool of high ranking military officers (selected from the military forces of all member worlds) who are trained in large unit command and staff operations.
During time of war, all military forces are confederalized and placed under a single unified command. For ground forces, divisions will be commanded by generals from the individual worlds, corps, and higher organizations by Confederation officers. The component forces of a division will be from the same world whenever possible. For naval forces, individual ships are under the command of local officers, squadrons and fleets by Confederation officers
Tags: history.

Sylean Federation
(-650 to 0)
Large interstellar federation which served as the basis for the Third Imperium.
Established on Sylea in -650, the Federation grew slowly, absorbing several surrounding worlds and increasing trade and interaction between worlds.
By -30, the real power in the Federation was an industrial consortium headed by Cleon Zhunastu. Cleon, a Solomani noble of great vision, used his family industrial base and the support of other families (obtained by the persuasiveness of his personality) to obtain behind-the-scenes control of the Federation government and to begin an active campaign to increase the number of worlds under its control.
After 30 years of economic and diplomatic maneuvering (and occasional military action), Cleon had increased the size of the Federation and extended its control to the edge of what is now Core sector. Cleon envisioned a territory larger than a single sector, however, and concluded that the tightly controlled, highly centralized nature of the government of the Sylean Federation was not suitable for a large, star spanning empire.
Cleon decided the Federation had served its purpose, and he began plans for a more suitable form of interstellar government, which would allow greater local autonomy but maintain cohesion over large distances. In addition, to restore the past glories of the Rule of Man (and therefore lay claim to all former territories of the First and Second Imperiums), Cleon proposed to revive the Imperium.
This was made possible by the fact that in the closing years of the period known as Twilight, one of the last claimants to the throne of the Rule of Man had made Sylea his capital. Cleon traced the legitimacy of the Sylean Federation back through this emperor to the Rule of Man and (since the Rule of Man claimed to be the lawful successor to the Vilani Imperium) to the First Imperium as well.
In the 651st year of the Sylean Federation, the Grand Senate of the Federation "persuaded" Cleon to accept the Imperial crown. That year he was crowned First Emperor of the Third Imperium, and he proclaimed the 651st year of the Sylean Federation to be the Year Zero of the Third Imperium.
Tags: history.

Synthetic
An artificial (manufactured) being blending organic (living) and mechanical (non-living) elements, built from a master template or blueprint. Synthetics blend biological and nonbiological processes (the specific proportion may vary). Synthetic refers to the general class of created beings between natural and robotic. An Android is a synthetic human. A Sophontoid is a synthetic sophont. Semi-Organic is the term used to describe the nature of the components inside a Synthetic.

System
A star and its family of planets and satellites. The term system denotes a major world and its associated star, plus any other planets, satellites, asteroids, and other bodies.

System Defense Boat
Also called SDB. A nonstarship specifically intended for defensive operations inside a star system. Developed on the principle that a nonstarship (because of the increased armament made possible by its lack of jump drives) can normally defeat a starship of equal tonnage. System Defense Boats are typically stationed at the vital points of a system (the gas giants, the asteroid belt, the major world, and so on), and they attack invading vessels according to one or more predetermined plans.
System defense boats range in size from displacements of 100 to 5000 dtons and are constructed at all tech levels. There are hundreds of different types, which depend upon the specific mission for which they are designed.
See also Gunboat.

Tavrchedl'
The Tavrchedl' or "Guardians of Our Morality" are a law enforcement branch of the Zhodani Government. The infamous Thought Police are charged with maintaining right thought by the population. Primarily an internal attitude and security police, their responsibility is internal order within the Zhodani Consulate.  Effectively, they operate as a secret police force constantly spying on the population with psionics. Their mission is to catch anyone who is discontented with the system, their lot in life, or their superiors and provide a re-education for them.

TED
Technologically Elevated Dictator.  The term used for any planetary warlord who derives power from the possession of a small number of relic weapons which are used to terrorize the population.  These weapons can not be maintained or replaced on a TED's world, and many of these warlords retain power by bluffing with weapons that no longer function.  TEDs with working weapons periodically feel the need to demonstrate these weapons on unfortunate peasants to maintain the terror that ensures their position.
These warlords are typically xenophobic, knowing that interstellar contact will destroy the small advantage that maintains their power.  These warlords will make every attempt to imprison or kill any interstellar visitors, and have proven to be the demise of many free traders.


Terra (Solomani Rim/Sol 1827 A867A69-F)
Also known as Earth. Origin world of the genetic stock from which all races of humaniti descended, former capital of the Terran Confederation, former capital of the Old Earth Union, and former capital of the Solomani Autonomous Region.  The word Terran (used to refer to an inhabitant of this world or to a citizen of the Terran Confederation) is derived from the name of this world.

Terraforming
Altering a planetary environment to improve habitability.  Global terraforming involves making substantial improvements on a world with an unfavorable global environment. An example is terraforming a world with an insidious atmosphere into one with a standard atmosphere.
     Total terraforming involves complete transformation of a world's basic environment to a radically different basic environment of one's choosing. An example would be terraforming a barren vacuum world into a lush, rich world with a dense atmosphere.

Terran Confederation
(-2398 to -2204)
Interstellar government consisting of Terra and its colony worlds. The Terran Confederation has its roots in the formation of the United Nations Space Coordination Agency (UNSCA) in -2499. In addition to handling mundane responsibilities that helped avoid conflict, UNSCA soon became a clearing house for space operations.
One of UNSCA's natural directions was research. In -2431, UNSCA researchers in the system's asteroid belt, who were looking for better drives to transport ores, discovered jump drive. The first jump drives were used only in the solar system--they were too weak to be used for interstellar travel. In -2424, for various reasons, the first interstellar jump expedition traveled to Barnard's Star rather than Alpha Centauri.
Upon their return in -2422, the expedition members were hurried into a hushed meeting with UNSCA. The expedition had encountered alien intelligent life, humans no less! The expedition members had encountered a Vilani prospecting outpost, an outpost on the very fringe of a vast, advanced empire controlled by alien humans. It came as quite a shock to the Terrans that many of the worlds only a few parsecs away were already claimed. Politicians echoed the popular sentiment that it was unfair for alien humans from several hundred light- years away claim worlds near Terra. Individual nations began expanding their armed forces and building starships.
Over the next two decades, UNSCA and the United Nations transformed itself into a true world government, which administered the defense of Terra against the Vilani Empire.
When Terran colonies formed on other worlds were granted membership in -2400, the UN officially changed its name to the United Worlds. Two years later, upon the admission of colonial representatives to the Secretariat, the name was changed again to the Terran Confederation.
The Terran Confederation fought a series of interstellar wars with the Vilani Imperium over the period -2408 to -2219. These wars ultimately resulted in the fall of the Vilani Grand Imperium. The Confederation was dissolved in -2204 upon the proclamation of the Rule of Man to replace the Vilani Imperium.
See also Rule of Man, Nth Interstellar War, and Solomani
Tags: history.

Terran Prime
Designation used in astrographical surveys of unpopulated regions. These worlds are similar to Terra, and as such are much prized as possible habitations. To be classed as such, the following must be true: Diameter 8640 to 15200 km, atmosphere 4 to 9, hydrographic percentage 36 to 95%, gravity 0.6 to 1.1g. Within this is the category Terra Norm (diameter 9440 to 15200 km, atmosphere 6 or 7, hydrographic percentage 46 to 75, and gravity 0.75 to 1.1g), a classification which almost guarantees successful colonization.


Third Frontier War
(979 to 986)
The long period of uneasy peace between the Imperium and the Zhodani Consulate erupted into war in 979 with simultaneous blows by the Zhodani in the Querion and Jewell subsectors. Imperial reaction was deficient, and the hostilities continued for nearly six years with little to show for it. The armistice finally signed in 986 gave each side little, and it brought about the abdication of Emperor Styryx in 989.
Tags: history.

Third Imperium (0 to present): Also called The Imperium.
Founded in 0 by Cleon Zhunastu from the Sylean Federation in what is now Core sector. The Imperium grew swiftly during the pacification campaigns and more slowly thereafter until stability was reached in the 600's, by which time the Imperium had absorbed much of the territory of the First and Second Imperiums.
Government Structure: The Imperium can best be thought of as a form of feudal confederation. Member worlds of the Imperium agree to pay taxes and obey a few fundamental laws which the Imperium promulgates, known as the High Laws. In return, the Imperium agrees to patrol the space between the worlds, to protect interstellar trade, to encourage travel and commerce, and to arbitrate diplomatic relations between worlds. Beyond this, individual worlds are left to their own devices so long as they acknowledge the power of the Imperium to rule the space between the stars.
Imperial power is present on the member worlds in the form of consulates, bureaucratic offices, and bases. Sometimes, larger enclaves of Imperial power are placed where they can enhance the Emperor's strength.
The Imperium's territory is divided into sectors, which are in turn divided into subsectors and systems. Groups of sectors, called domains, have been created above the sector level.
During the Pacification Campaigns, Emperor Artemsus divided chartered space into six regions, labeled them domains, and appointed an archduke over each of them.  To each archduke, he assigned the continuing pacification of the domain's many systems and their integration into the Imperium. The domains were: Sylea (Core, Fornast, Massila, Delphi), Vland (Corridor, Vland, Gushemege, Dagudashaag), Gateway (Ley, Glimmerdrift Reaches, Gateway, Crucis Margin), Ilelish (Ilelish, Zarushagar, Reaver's Deep, Daibei), Antares (Lishun, Antares, Mendan, Amdukan), and Sol (Diaspora, Old Expanses, Solomani Rim, Alpha Crucis). Most of the domains were never totally absorbed into the Imperium.
In 589, during the First Frontier War, a seventh domain was established: Deneb (Spinward Marches, Deneb, Trojan Reach, Reft). The intent was to appoint an archduke to be responsible for their supervision. However, the Civil War broke out before an archduke was appointed.
Following the civil war, the emperors expressed concern about individuals with powers equaling their own, so they moved to lessen the power of the archdukes in the Imperial government. Because of this, no Archduke of Deneb was ever appointed. As a result, the domains came to have little practical significance.  Each archduke did retain the power to create knights and baronets.
In the years after the Fourth Frontier War, and the problems it presented from lags in communication, Emperor Strephon felt that a strengthened archduke position could enable the Imperium to more quickly respond in the defense of the realm. Against the protests and opposition of prominent members of the Moot, Strephon has reinstituted a number of powers to the domains, most notably the right to collect taxes.
Tags: general.

Thoengling Empire
Large, centralized state in the Vargr Extents. The Thoengling Empire is one of the most stable of the Vargr states and has existed in its current form since 792. The Emperor, who has great governmental authority, is chosen for life by vote of an elected assembly; by law, no member of the emperor's family may succeeded them. Sons and daughters of the higher nobility are brought up at the Imperial court, where every effort is made to inculcate personal loyalty to the Emperor.
The Thoengling Empire has become a major trading partner of the Imperium and generally supports Imperial interests in the Vargr Extents.

Tireen (Knaeling 2910/X484XXX-X)
A multi-world rosette in Knaeleng sector, in the Vargr extents, created by the Ancients. Five planets were shifted into points equidistant from each other in the same orbit and then transformed into identical habitats. Evidence as to what the worlds were like before the shift is lacking, so the degree of transformation is unknown, but even shifting worlds in their orbits consumes unbelievable amounts of energy, and the Ancients shifted at least four worlds in that system.
Each of the worlds has physical characteristics 484, which indicates that the worlds would be especially hospitable to Droyne. At least one of the worlds in the rosette was inhabited by Droyne when the system was discovered by Vargr in -2530, but they have since died out.
Tags: ancient.

Tractor/Pressor
Barbette weapon. Tractors and Pressors (reversed polarity versions of the same principle) are grav-based remote manipulators. Each is capable of applying pressure (tractors pull an object toward it; pressors push an object away from it; each is capable of applying some lateral pressure). 
Tags: defense.


Trade Routes
Routes which jump-capable starships travel between major worlds and which connect vital suppliers with essential markets, important government worlds with high population worlds, and strategic resources with exploiting industry. Trade routes are a natural outgrowth of economic and market pressures. When a market is no longer profitable, the trade routes bypass it.
The trade routes are typically the territory of the Imperium's largest trading companies. They maintain fleets of commercial transports and merchants who serve these trade worlds, and they reap large profits in doing so.
But trade routes directly serve fewer than a tenth of the worlds of the Imperium. The other 90 percent of the Imperium's worlds are served by feeder lines, tramp freighters, and free traders. These smaller companies and unscheduled ships carry passengers and cargo between worlds off the main trade routes.
Tags: astrography.


Trade Station
Establishment for the promotion of interstellar commerce. There is no single controlling agency for trade stations; some are established by private companies, on their own, or on contract to the Imperium, some are run by the scout service, and others are operated by different branches of the Imperial government.


Trake
Small berry common to many worlds of the Imperium. the trake has a meaty, sweet body enclosing a single large seed and grows on a low, thorny bush. Trakes have grown in the Imperial Core since the time of the First Imperium. Introduced late to the Spinward larches, they have flourished on only a few worlds, most notably Pysadi and Alell, although they are cultivated on many others.
See also Atrake


Traveller News Service
The major news agency of the Imperium, owned by the Travellers' Aid Society. TNS has bureaus on most major worlds throughout the Imperium and representatives at most starports.
Tags: general.

Travel Zone
Standard form of classification for worlds in terms of relative danger. As a service to spacefarers, the Traveller's Aid Society publishes travel zone classifications that indicate the degree of danger a world presents to visitors.  Standard classifications are green (no danger), amber (caution advised), and red (severe danger).
See also Amber Zone, Red Zone
Tags: general.


Trojan Points
In a gravitational system composed of a small body orbiting a much larger one (such as a planet and star or a moon and planet), there are two stable points lying in the small body's orbit 60 degrees ahead and behind it, and thus equidistant from the small and large bodies. These are called Trojan Points (also LaGrangian points, which are abbreviated as L4 and L5).
The Trojan points of of a gas giant near an asteroid belt commonly collect a cluster of asteroids. The name comes from the first such cluster discovered by Terrans at Jupiter in the Sol system; the asteroids are named after mythical heroes of the Trojan war.

Trokh
Language of the Aslan race, constant throughout all Aslan worlds, except for a few isolated colonies. This has done much to offset the effects of clan rivalry on interstellar commerce within the Hierate, and diplomatic relations With other interstellar states.
Trokh is a polysynthetic verb-based language. What this means is that the Trokh verb has a number of classes of prefixes and suffixes (twenty classes, to be specific) which modify the verb in a way that can fully express a wide variety of concepts, often without the need for supporting noun phrases. Trokh also has separate grammars based on the gender-role of the speaker: martial-male and economic-female. Example: Ke’kheii’atyerhkeifeiaorihtseha khih akhhyah, which means, all people are born free with honorable rights ("honorable rights" is a gloss for "equal in dignity and rights").
Tags: language.

Tukera Lines, LIC
Tukera Lines operates a vast fleet of passenger and freight vessels throughout the Imperium, following the Xboat lines. In some subsectors (particularly the older, more established regions of the Imperium) Tukera Lines has a virtual monopoly on long distance shipping and travel.
The oldest record of the firm is a charter from the government of the Sylean Federation, but family tradition holds the company to be several centuries older.
In the Spinward Marches Tukera runs passenger and freight services between all the worlds on the xpress boat routes. In support of these operations, the company also owns marketing facilities, shipyards, ports and even staff training colleges. Their most extensive holdings are the transport company based in Aramis subsector, which is wholly owned by Tukera. The corporation uses its Imperium wide connections to provide highly profitable markets for the unusual products of the subsectors.
Stock Ownership: Tukera family- 29%, Imperial family- 3% Other corporations- 9%, Private ownership- 31%, Investment trusts- 28%.
Tags: company megacorporation.


Twilight
(-1776 to -1526)
The failure of the Rule of Man triggered the collapse of most interstellar civilization. while interstellar travel and commerce continued, it was at a greatly reduced rate, and the many worlds of the Imperium turned in on themselves. The period of collapse is termed Twilight, and it lasted for two and a half centuries.
Modern historians consider Twilight to have begun in -1776 when the treasury on Hub/Ershur refused to acknowledge a monetary issue of the branch treasury at Antares, which triggered a financial collapse and the destruction of large-scale trade within the Imperium.
The end of Twilight is commonly accepted as the year -1526, when the last government claiming to be the Rule of Man ceased to exist.
See also Long Night.
Tags: history.

Twilight's Peak
Legendary or apocryphal story of lost starfarers on an unknown world who discover fantastic structures and devices while surviving a terrible winter.  Phrased as an epic poem of execrable quality, the story is most notable only in that it is based on fact: a task force was lost in the time period specified, and it has not been recovered or accounted for.

Two Thousand Worlds
Most common name in the Imperium for the region of space ruled by the K'kree.  "Two Thousand Worlds" is a literal translation of the K'kree T't'tkahk Xeng Kirr. The same words can also be rendered idiomatically as "universe". In past times, the words meant "night sky",as roughly two thousand stars can be seen from one hemisphere of Kirur, the K'kree homeworld. The name should not be taken to mean that there are exactly two thousand systems in the K'kree empire.
The K'kree government is highly conservative. The current dynasty ruling the Two Thousand Worlds has been in power since prehistoric times, and the form of the government has remained unchanged except for a few minor modifications made necessary by the problems inherent in governing an interstellar empire.
K'kree expansion into space progressed very slowly after the discovery of the jump drive in -4142. The conservative nature of society and the technical limitations placed upon spaceflight by that society (K'kree spaceships must be very large, for example) combined to inhibit early exploration and colonization.
The discovery of other sophonts caused a xenophobic reaction in k'kree society.  The realization that intelligent carnivores might exist somewhere in space sparked the K'kree obsession to convert the universe to herbivorism. This obsession stimulated the growth of the Two Thousand Worlds to its present size and still dominates K'kree culture. Local cultures are tolerated and other aspects of K'kree society are not heavily enforced, but all races within the Two Thousand Worlds are herbivorous.
K'kree contact with the Hive Federation was soon followed by the Hiver-K'kree war of -2029 to -2013. The military technology of the K'kree proved superior in the first stages of the war. The war ended due to nonmilitary considerations, however, when the Hive Federation demonstrated a plan to radically alter the 'K'kree social order through the the use of psychohistorical techniques and threatened to implement it. The K'kree withdrew to the antebellum borders, and the border between the to states has remained stable to this day.
The K'kree Empire eventually stopped in its expansion. Increasing problems of administration over interstellar distances and contact with other starfaring races (such as hivers and humaniti) have stabilized the Two Thousand Worlds at its present size.


Tyeyo FteahrAo Yolr
Aslan interface line. Literally, "Tyeyo Dustspice Importers." During the period immediately after the Aslan Border Wars, the Aslan discovered Dustspice. It was then available only in the Spinward Marches: TFY imported dustspice into the Alan Hierate.
     Synthetic dustspice has become available. Natural dustspice, now a gourmet treat, is no longer imported in quantity. TFY instead seeks out any novel or valuable trade goods along the route from Mora to Kuzu.
Tags: company.


Tyrfing Incident (Event)
(-104): Clash between naval vessels of Gram and Sacnoth in orbit above Tyrfing (0504 Sword Worlds) which resulted in the War of the First Rebellion (-104 to -88). As a result, the Sword Worlds Confederation dissolved into several separate states, and conflict between them continued for the next century. 
Tags: history.


University of Regina
A broad spectrum planetary institution providing education in all areas; its campuses are scattered all over Regina. Its greatest strength is history, sociology, psychology, and political science.

University of Rhylanor
A technically oriented planetary institution to support industry and commerce on Rhylanor. Its primary programs include the hard sciences: biology, chemistry, electronics, gravitics, mechanics, physics.

UTP (Fledgling Line)
Home Port: Uakye. Territory: Regina subsector. 
The task of starting up an interstellar transport line is a difficult one; this particular line was formed as a partnership of five free trader ships which agreed to work together. Their company (UakyeTransport Partners)has concentrated on operations between Efate and Regina. 
Tags: company.


Vargr
Intelligent major race derived from Ancient genetic manipulations of Terran carnivore/chaser stock, which apparently dates from approximately the same time that humaniti was scattered to the stars.
Inhabiting a region coreward of the Imperium, the Vargr were a puzzle to xenologists. The biochemistry and genetic makeup are almost identical with a number of terrestrial animals, but they differ radically from most of the flora and fauna indigenous to Lair, which is the purported Vargr home world.  Research during the early years of the Third Imperium concluded them to be the result of genetic manipulation of transplanted Terran animals of the family Canidae, almost certainly of genus Canis. The obvious conclusion, supported by archaeological evidence, is that the race known as the Ancients was responsible.  The typical Vargr is about 1.6 meters in height and weighs approximately 60 kilograms. They are upright, bipedal carnivores, with rear limbs digitigrade and hands very similar in size and appearance to those of a human, although there are significant internal differences. They have approximately the same physical parameters as humans and are able to use the same equipment without modification or additional instruction.
On average their reactions are slightly faster than those of the typical human, but individuals vary widely. The Vargr senses of smell and sight are superior to those of humans.
Government: There is no central Vargr government; indeed, there is no governmental type that can be said to be "typically vargr". Every conceivable form of governmental organization can be found somewhere in the Vargr Extents.  The only cohesive force in the Extents is a fierce racial pride which causes a slight tendency towards racial cooperation.
The higher the level of the Vargr government, the more unstable it becomes because of the difficulty of obtaining consent of all Vargr involved.  Vargr in the Imperium: While only a few planets populated completely by Vargr exist within the Imperium, there are millions of Vargr citizens of loyal subject planets. Additionally, Vargr adventurers, criminals, mercenaries and traders can be found throughout the coreward reaches of the Imperium.
Society: The key elements shaping Vargr societies are a very strong centrifugal force resulting from an emphasis on personal leadership and a deeply ingrained family-group-race loyalty and an equally strong centripetal force resulting from acceptance only of informal lines of authority, an a constant competition for power between the more charismatic members of a group.
Centralized authority is extremely limited at the upper levels of Vargr society, and action is based on broad coalition concerns, with a constant splitting and rejoining by dissident factions. Traditionally, this has made it very difficult for more centralized and organized societies such as the Imperium to deal on a meaningful basis with what passes for Vargr states.
The Vargr have little respect for formal authority, and what respect they might have decreases as that authority becomes more remote. Vargr tend to respect informal authority figures more, and they obey superiors who are better known to them.
The Vargr have an intensive racial pride, and they are easily insulted. They are prone to enter fights without regard to possible consequences. Vargr social organization is difficult to characterize in Terran terms, but it can be most closely compared to the Dakota Sioux of North America in c. -2700, if the analogy is not pressed too far.
Even within the most stable Vargr governments, a highly charismatic leader can attract followers for almost any cause. The neighbors of the Vargr are constantly subject to impromptu raids and scattered piracy by bands of Vargr (totally without government sanction) who have been talked into a raid, a battle, or a war by a charismatic leader.
Tags: sophont.

Vargr Campaigns (220 to 348)
The series of wars, encounters, conflicts, and disputes between the Imperium and the various Vargr states in Vland, Corridor, and Deneb sectors along the coreward edge of the Imperium.
As the Imperium expanded, it initially recruited worlds that were former members of the First and Second Imperium. As its borders reached still farther, the Imperial expansion met already established Vargr states of varying sizes. The Imperium struggled for over a century to secure its territory against the Vargr; the inevitable series of conflicts that resulted are collectively called the Vargr campaigns.
Tags: history.

Vargr Extents
The territory dominated by varied, and numerous, Vargr splinter states. The term Vargr Extents refers to those sectors with major Vargr populations. The Extents are situated roughly coreward of the Imperium and especially coreward of the Spinward Marches, Deneb, Corridor, and Vland sectors.

Varian
Prince of the Imperium, son of Princess Lydia and Duke Dresden, the elder of the Emperor Strephon's twin nephews. Third in line to the throne, being born only minutes before his brother Lucan.

Vegan
An intelligent race originating on Muan Gwi (Solomani Rim 1717 A456A86-F) and inhabiting the Vegan Autonomous District (q.v.); they are named by humans after the bright star in their home subsector.
Physiology: Vegans are upright, bipedal and bilaterally symmetrical, averaging 2.2 meters in height. They are bisexual, homeothermic oxygen breathers with an average life span of over 200 years. Because of their low-gravity origin, they are physically quite weak, and are unable to live on high gravity worlds.
The head serves both as a brain case and sensory appendage. Auditory organs are located in the collar-like structure around the neck. Despite external appearances to the contrary, Vegans have to eyes. These are located in the fleshy hood-like structure that dominates the head. The paired eyes are covered by a transparent eyelid structure, which acts as a polarized light filter. This structure protects the eyes from glare, like built- in sunglasses, and also serves to keep windblown dust out of the eyes. This filter can be retracted when not needed. The eyes themselves are large, and pick up radiation well into the infrared portion of the spectrum, an adaptation to Muan Gwi's small red sun. 
Since the skull is fixed solidly in place, a Vegan cannot turn its head, but the fleshy hood containing the eyes can turn through a large arc.
The mouth is a vertical slit in the upper thoracic region, with paired breathing/vocal slits on either side of it. Two mandibles are located inside the upper chest, and grind food with two opposing sets of teeth. Where the forearm would be on a human, Vegans have three tentacles, which serve as manipulative organs. Their legs end in broad, splayed feet, which prevent them from sinking into the soft sand of Muan Gwi. The urogenital opening is a vertical slit located ventrally in the lower abdomen. There are no external differences between the sexes.
Vegans have a number of adaptations to the arid dry region of Muan Gwi where they developed. Their tall, thin bodies are designed for maximum radiation of heat. The torso is covered with a thick integument, whose convoluted surface is richly supplied with blood vessels. By increasing or decreasing the supply of blood to the integument, heat radiation from the torso can regulated to optimum effect. This arrangement makes perspiration, and the consequent water loss unnecessary. All bodily orifices can be sealed to prevent moisture loss.
History: The Vegans received jump drive circa -6000 from Vilani influenced traders, and colonized several nearby worlds before being absorbed by the first Imperium in -4404. They were severely restricted under Vilani rule, as were all races that resisted integration into the rigid Vilani culture. Because of this they welcomed the Terran victory in the Interstellar Wars and the advent of the Rule of Man. the Vegan Polity prospered under the Rule of Man and survived the Long Night largely intact. However, with the emergence of the Third Imperium in the region, the Vegan area was broken into individual world states in accord with Imperial policy; non-humans were treated as full citizens, but in order to cement Imperial authority no multiworld governmental units were allowed.
Under the Solomani, the Vegans were again restricted. human colonies were founded on many Vegan worlds to maintain solomani influence there, and Solomani governors were installed on all worlds. After the Solomani Rim War (q.v.), the present Vegan Autonomous District was formed as a counterweight to the Solomani.
Society: Vegan society is divided into hundreds of different tuhuir, which might be roughly translated as a culture, philosophy or tao. Each tuhuir has its own customs and traditions and its own interpretation of the proper way to live. The civil service which governs the Vegan District is a tuhuir that oversees and mediates between all the other tuhuir. Although rare, heretical and rebellious tuhuir do exist.
Archaeology shows that the tuhuir were once separate societies, each associated with a particular geographic location, like the countries of ancient Terra. Now, however, they are mixed together in complex patterns. Tuhuir are not hereditary; when a vegan nears sexual maturity, he or she enters a period of search, which may last for many years. Eventually, the individual chooses a tuhuir; once made, the choice is for life. In practice, about 50% of all Vegans enter the tuhuir of their parents (the exact percentage varies between tuhuir); about 5% find that they enjoy the search as a way of life and never join a tuhuir.
Tags: sophont.

Vegan Automonous District
After the pyrrhic victory over the Solomani at Terra in 1002, the Imperium found that it could not completely conquer and absorb the rest of the Solomani Sphere.  The Imperial high command decided to create the Vegan Automonous District to act as a counterweight to the remnants of the Solomani Confederation. The Vegans have complete internal control over their district, but free passage is guaranteed for Imperial citizens and goods.
Although many factors have contributed to the present peace and stability along the Solomani Rim, it cannot be denied that the creation of the Vegan Automonous District has achieved its original purpose.
The worlds of the Vegan Automonous District are under a single, centralized government. State power is contained in a civil service and is chosen and promoted by competitive examinations.

Vilani
Human major race (H. sapiens) that developed on Vland from human stock placed there by the Ancients.
History: The world of Vland, while possessed of a hospitable environment, boasted an alien ecology based on its own independently evolved biology, a biology that produced amino acids, proteins, and sugars that were difficult for humans to digest and metabolize. The humans just could not use local plant and animal life for food.
One of the oldest occupations in Vilani society is that of shugilii (which translates roughly as miller). The shugilii was a person who could transform raw food into edible food through special aging and chemical treatments. The shugilii position was more akin to that of shaman or witch doctor than that of cook. Since virtually no food on Vland was edible without some treatment, shugilii were powerful members of society.
The alienness of land was reciprocal: humans were unsuitable as food for predators, parasites died because humans provided no nutrition, bacteria could not infect the human system, and even viruses were unable to invade and take over human cells. Consequently, the primitive human society found no need for medically oriented shaman. Vilani medical understanding was very slow to develop because of this.
Vilani legends are full of accounts of the wars of the gods, terrible destruction, and occasional intervention in human affairs by the gods. Legends exist of early explorers who found lands with great living stone-metal gods possessed of immense magical powers. Modern archaeologists now believe these "gods" were actually great robot warriors and juggernauts used by the ancients in the final war. Apparently, the last of these machines finally ran down around -20,000.
Society. Early Vilani society was dominated by three groups: the shugilii, the aristocrats, and the merchants. Aristocrats were the natural leaders of society, the shugilii were the all important food processors, and the merchants controlled trade.
With the flowering of Vilani society (circa -11,000) and its attendant industrial revolution, each of these three forces gained power rather than lost it; each participated in the creation of the industrialized wealth of Vland.  In -9235 the Vilani made their ultimate breakthrough, one that would assure their ascendence for the next 6000 years. A research team working on the fringes of the Vland system created the first working prototype jump drive and demonstrated its effects.
The Vilani discovered intelligent lifeforms on other worlds within 60 parsecs of Vland. None of the races had progressed enough to have begun interstellar travel. The Vilani found it easy to dominate these less technically advanced races. The Vilani were able to impose Vilani culture and law on these other races among the stars. However, the Vilani conquering was not of a militaristic nature, but was economic subjugation.
As their sphere of influence was expanding, the Vilani found it difficult to maintain control across such great distances with jump-l their maximum rate of travel and communication. At the same time, each of the three power classes of the Vilani society found themselves threatened by the forces around it.
Three bureaus were established, each independent of the other two, and each assigned a territory among the stars for which it was responsible. Each of the three bureaus was effectively identical, but they initially espoused different philosophies, which were based on their origins. The bureaus maintained their own governments within their territories.
Silarurshid, originating with the merchant class, emphasized interstellar trade.  Makhidkarun, originating with the aristocracy, emphasized interstellar government. Naasirka, originating with the shugilii, floundered after it found that it could not control food supplies on most worlds it dealt with, but it ultimately became a broad based organization, emphasizing energy, transport, and luxury goods.
In -5430, the Vilani finally discovered jump-2. No other race had jump-2, and the Vilani maintained its monopoly on jump-2 by jealously guarding its secrets from all subject races.
Beginning in -5400, a series of wars to subjugate the resisting fringe cultures was waged. This period of consolidation lasted until -4045.
Grand Empire of Stars: In -4045, the ruling Vilani council, the Igsiirdi, declared the Grand Empire of Stars, or in the Vilani tongue the Ziru Sirka. The Vilani calendar starts on this date.
At first, the Empire had no emperor. Within 10 years, the chairman of the Igsiirdi (elected for life by the council) was declared the Isilimkarun, the Shadow Emperor, Who ruled by published proclamation, but never appeared in public. In -3610, the Shadow Emperor became Emperor of the Stars, who was absolute monarch of the Empire. Successors were elected from the Igsiirdi upon the death of the old emperor.
For nearly 1,200 years the Grand Empire of Stars Kept peace among its star spanning population. however, the empire insisted on cultural rigidity.  Exploration was brought to a halt by -4000. Scientific research was controlled and then stopped altogether by -3800.
The beginning of the end of Vilani domination, however, was emphasized when the Terrans contacted the empire in -2422. By - 2408 the Terrans and the Vilani were at war; by -2219 the Terrans had surpassed the Vilani technology and were marching through the cities of Vland as conquerors, and the Grand Empire of Stars was at an end.
Currently, Vilani is a cultural rather than racial or national labeling, and it is applied to those within the Imperium who retain some of the old ways. 
Dialects of the old High Vilani language survive in certain places, along with a few other fragments of Vilani culture, such as musical forms and other fine arts. Certain of the old Vilani noble families have maintained more of the old culture. In particular, those who control the Vilani megacorporations instill a predominantly Vilani culture on many of their employees.
Tags: sophont.


Vilani Calendar
The Vilani calendar is based on the period of Vland (the Vilani homeworld) around Urakkalan, its star. The Vilani Gurkala (year) is 478.72 standard days in length.
See also Vland, First Imperium.

Vilani Language
The group of languages derived from the official language of the Ziru Sirka. In modern times there are three versions common throughout the Imperium. Old High Vilani has a similar status to that of Latin on pre-stellar Terra; many Vilani-based languages of Imperial worlds are closely related to this language.  Secondly, there is Classical Written Vilani. Used in the Ziru Sirka to help surmount the difficulties of language differences which emerged across the vast distances of that empire, its spelling, grammar, etc remained constant throughout the empire, even when pronunciation varied. Finally, there is Modern Vilani, still used as a first language on many Imperial worlds. It is this form that members of Imperial service are required to have a working knowledge of. 
The language has three sub-languages; one for speaking to ones' social superiors (Inferior), one for speaking to ones' social inferiors (Superior), and a third for use only with family members, pets, and close, life-long friends.
The language is agglutinative, with some synthetic aspects. The basic word order is Verb – Subject – Object (VSO). Vilani is ergative in its surface structure as well as its underlying syntax structure.
Tags: language.

Vland (Vland/Vland 1717 A967A9A-F)
Homeworld of the Vilani, former capital of the Vilani Imperium, current capital of the Vland sector. Vland is a major trade and cultural center for the coreward/spinward regions of the Imperium.

War
Major violent conflict between nations, corporations, or races.
See also Good War/Bad War, Imperial Rules of War.

Warrant of Restoration
The document forming the basis for the foundation of the Third Imperium. The Warrant for the Restoration of the Grand Empire of the Stars was presented to the Grand Senate of the Sylean Federation by Cleon Zhunastu in -1. Once ratified it signaled the creation of the Third Imperium, serving as the constitution of the Third Imperium, and declaring Cleon the hereditary emperor. The document has been extended and modified by every emperor over the past 1,000 years.
Tags: history.

Way Station
Link in the express boat network. The way station is a large (for the Scout Service) base devoted to the overhaul and refit of express boats at points in their journeys. During a normal tour of duty, an express boat will jump from system to system, and occasionally change pilots, but steadily work its way farther and farther down the line.
At each stop (Xboat station), the Xboat is routinely checked, refuelled, reprovisioned, and sometimes recrewed. Ultimately, however, the Xboat must undergo maintenance and possible repair after the rigors of its mission. The way station performs this function.
Way stations have stocks of scout-oriented repair and maintenance equipment, as well as trained staffs of service personnel. They are the equivalent of naval bases, although they are capable of servicing only smaller displacement ships (10000 and less) due to the size and orientation of their facilities.
Tags: general.

Wilds
Refers to interstellar areas of a former empire or empires where there is no regular interstellar community.

Xboat
See Express Boat

Xboat Station
Facility for handling Xboats at a star system. At each system served by the Xboat network, an express boat station is maintained to handle the message traffic and to manage incoming and outgoing Xboat.
Usually located near the edge of a star system, the station picks up messages beamed to it by incoming Xboats and relays the data to the local world for delivery. Messages destined for worlds farther down the line are transmitted to a waiting Xboat which jumps for the next world in the network.
The Xboat station contains receiving and retransmitting equipment; refuelling and support facilities for the local staff and waiting crews are also provided. 
The Xboat station maintains a local office on the system's major world for the acceptance of Xboat messages, as well as to handle delivery of the messages to addresses on the world.
Tags: xboat.

Xboat Tender
These 1000-ton displacement vessels are intermediaries between Xboats boats and their stations. They retrieve the Xboats, prepare them for their next jump and provide routine maintenance requirements. An internal Ship bay can hold up to four Express Boats, or two Scout/Couriers, and so are often used by the IISS as field repair workshops. In the more remote parts of the boat network, small groups of one to three such vessels act as the entire boat station with no permanent facility whatsoever. The Imperial Navy have pressed approximately 144 of these vessels into tanker duty, supporting fighter squadrons patrolling frontier worlds. They are also popular as bulk ore carriers and as corsairs, where the ship bay comes in useful for boarding procedures, allowing captured vessels to be stripped at leisure.
Tags: xboat.

Xmail
Information sent by Xboat. Also known as express mail and Imperial mail. Xboats carry information only (at least for their civilian customers); material objects may not be sent. Messages are digitally encoded; The message is printed out at its destination and delivered by a world's local mail service.
Some merchant companies operate an express Packet service, transporting small cargoes at speeds close to those of the Imperial boat network. These services are considerably more expensive than standard methods of cargo transport.
Tags: xboat.

Yacht
Typically in luxury service for nobles or famous entertainers. Buying passage is impossible, but the master may take a few on board on a whim.
QSP Y-BB11. Based on a braced 200t hull, the basic Type Y Yacht is a noble's plaything; not a particularly efficient vessel, but plush and comfortable. It comes in a wide variety of styles. It has jump drive-A, maneuver drive-A, and power plant-A, with fuel for one jump-1, three weeks' operation, plus tankage for refuelling the ship's boat. Attached to the bridge is a computer Model/1. An orbit-to-orbit ship, the yacht carries a ship's boat as a link to planets visited. The ship also carries an air/raft and an ATV. The ship's boat has passenger accomodations and space for cargo or the ATV. Cargo capacity is typically 11 to 13 tons. There is one hardpoint, often with a high-powered Communicator in a deployable turret.
Though the owner's suite is oversized, the guest rooms are not overly large, but they are quite luxurious. Crew space includes the galley and crew lounge, a dumb waiter-life arrangement that leads up to the passenger lounge, engineering, and storage for cargo and the ship's vehicles.
The Type Y requires a crew of four: pilot/astrogator, engineer, medic, and steward. It carries 10 passengers (including the owner). Yachts are often excellent sources of employment for adventurers with star-faring experience. Paid professional crews are sometimes hard to come by; many nobles hardly ever use their vessels, but need a full-time crew to care for the ship, and to transfer it from one world to another (particularly when the noble has several far-flung estates).
Tags: Starships.

Yaskoydray
(Oynprith - "Grandfather".) A myth common to all Droyne societies is that of a god-like savior figure, known as Yaskoydray, who brought coyns to its people, and introduced harsh strictures against abandoning the way of life he brought.

Year Zero
The base year of the Imperial calendar is the founding year of the Third Imperium. By selecting a base year numbered zero (instead of the generally selected year 1), the Imperial dating system became a standard number line extending backward in time.
Years before the founding of the Imperium become simple negative numbers, and the differences between dates before and after the founding of the Imperium can be determined by subtraction.

Zdetl
Official language of the Zhodani Consulate, adopted as standard in -5718 (the 300th Olympiad). It is fairly constant throughout the consulate, the few dialects which exist arising primarily from the jargon of specific occupations, rather than a difference in language.
Tags: language.

Zhodane/Gaval (Zhodane 2719 A6547C8-F)
Capital of the Zhodani Consulate and homeworld of the Zhodani people. Unlike capitals of other interstellar states, Zhodane is largely divided into the estates of the members of the ruling Zhodani council, making the world's population unusually low. The three supreme Zhodani consuls, and the Grand Council, rule the Consulate from this world.
As is the case with all the homeworlds of human races, Zhdant is an Ancient site. In historic times, in addition to being the home of the Zhodani, Zhdant was also the home of a large population of chirpers. From this population of chirpers the Zhodani were able to learn their first few lessons in the previously unknown skill of psionics. All of the chirpers which made their home on Zhdant, as well as a population of them on Viepchakl, Zhdant's moon, were killed accidentally by a plague left over from the Ancient's Final War.

Zhodani
Human major race (H. sapiens) inhabiting the Zhodani Consulate, a region far spinward and coreward of the Imperium.
The Zhodani are a branch of Humaniti similar in most respects to other human races. In general, they tend to be taller than Solomani or Vilani, and lithe of build. Their most important difference is the acceptance and use of psionics. Zhodani society is divided into three classes: nobles, intendants, and proles. Nobles are the enfranchised ruling class, and receive psionic training from childhood. Intendants are the managers and administrators of society, and also receive early training. Proles constitute the masses, are forbidden the use of psionics, and do not receive training. Within this rigid class system, there are two opportunities for promotion to a higher class. All prole children are tested for psionic potential, and those showing high scores are taken from their families and adopted into the intendant class. Intendants are rewarded for great diligence, service to the state or victory in the psionic games, through the granting of noble rank.
The presence of psionics in the hands of those in power means that many aspects of society work at high efficiency. Psychology, behavioral science, communication science, and education are more refined and exact than in other societies. Educational methods are finely tuned, and capable of teaching concepts rapidly and accurately. Mental deviance or criminal tendencies can be detected early and corrected with facility.
Zhodani society is generally a happy one. Individuals are members of a functioning whole, with each making a contribution to its success. The relative lack of upward mobility for the proles is offset by the possibility for their children to move upwards if they have the proper potential. The burden of responsibility imposed on on the intendants is lightened by the ever present possibility of reward through elevation to the noble classes. The nobles themselves temper their burden of authority with the comfort derived from their station in life.
Morality: The Zhodani have a general distaste for other human races which do not practice psionics. Effective indoctrination and the ever present possibility that one's mind is being read have removed dishonesty and deviance as common features of society. The tavrchedl (Thought Police) are a special branch of the government who are charged with maintaining correct thought in the population.
Imperial distaste for the Zhodani is founded on two facts. Firstly, the Zhodani practice psionics, and an Imperial cannot be sure that a Zhodani is not invading his mental privacy at any time. Imperials feel exposed and uncomfortable in the presence of Zhodani. Second, because of their psionic abilities, the Zhodani have the most effective authoritarian government in history. Imperial citizens, used to a great degree of local autonomy, fear Zhodani conquest because of the loss of freedom it would entail.
Government: The Zhodani Consulate is a participatory democracy in which only nobles are allowed to vote. Executive and judicial functions are the responsibility of a series of councils of varying sizes. Each council elects one of its number as executive officer, and a number of its members as delegates to the next higher council.
Supreme executive power is vested in three consuls, one elected each Zhodani year for a term of one olympiad by and from the members of the Grand Council. No consul may be elected twice in succession, and retired consuls become life members of the Grand Council.
History: Zhodani history is considered to properly begin with their arrival with the Ancients c. -300 000. However, the first documented evidence of a major culture on Zhodane is of a moon worshipping empire, ascendant between -1000 and -15000. Much of the elementary stone age knowledge was developed in this period.The collapse of this empire lead to a dark age, until the emergence of a noble class and a feudal system c. -13000. The resultant encouragement of science and exploration resulted in settlement of much of Zhodane, and technological advancement to the point of elementary space flight. However, shortly afterwards a great plague decimated the population, and brought about a second dark age to the world. In the following period of recovery, psionics gained ascendance, and the development of the psionic aristocracy began.
The first psionic games were held in -6731, this being the first olympiad, and so the start of the Zhodani calendar. Space travel was reacquired, and the first sublight interstellar expeditions were mounted in c. -5000. Colonies were established on six worlds within four parsecs. In -5823 the Zhodani Consulate was established between these worlds. Then, in -5415, jump drive was discovered.The resulting expansion was gradual and uneventful. Although some states on the fringe resisted absorption into the Consulate, most were annexed peacefully. The Consulate first came into conflict with the expanding Imperium in the 500s, in disputes over the limits of present and future settlement of the Spinward Marches. The resulting Frontier Wars have done little to resolve the basic differences between the two empires.
Tags: sophont.

Zhodani Calendar
The Zhodani calendar is based on the period of Zhodane around Plebor, its star. 
The Zhodani Shen (year) is 275.19 standard days (or 244.44 zhodanstial, Zhodane's day) in length, and is divided into six Shider of 40 zhodanstial, separated by one day holidays. Zhodani dating uses Thecuzodij (olympiad), which are three Shen. A Zhodani date is written as: Thecuzodij.Shen Slider/Zilodanstial, with special holiday names replacing the Shider/Zhodanstial where appropriate. For example 001-0000 Imperial the date-the Imperium was founded) is equivalent to 2979.1 Atrint/7./

Ziru Sirka
Vilani name for the First Imperium. Translates directly as The Grand Empire of Stars. 
See also First Imperium.

Zirunkariish
A Vilani banking and investment company. Unlike most other Vilani megacorporations, whose origins are shrouded in mystery, Zirunkariish is known to have been founded by the noble Vilani family of Shiishuginsa (a member of which, Antiama, married the emperor Zhakirov in 679) in the year -425.Zirunkariish is one of the largest insurance underwriters in the Imperium, and while its capital reserves are gigantic, it usually chooses to invest them in various trusts rather than in other megacorporations. The megacorporation was a major source of the investment required for the expansion of the Sylean Federation into the Third Imperium.
Stock Ownership: Shiishuginsa- 29%, Imperial family- 18% Sharurshid trust-17%, Hortalez et Cie- 7%, Noble families- 12%, Investment trusts- 8%, Private ownership- 9%.
See Megacorporation
Tags: company megacorporation.

Zuchai Crystal
These crystals form the raw material for a vital focusing element in many designs of jump drive. They occur naturally, but can also be synthesized. However, natural crystals have a longer lifetime, and so command a higher price.
