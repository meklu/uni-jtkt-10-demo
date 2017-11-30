<?php

function getData() {
	static $corrupt = 0;
	$data = <<<EOF
Tämä on tosi kivaa esimerkkidataa.
Mikäli kaikki tässä maailmassa olisi OK,
ei tämä turmeltuisi kosmisen säteilyn vuoksi.
EOF;
	if ($corrupt !== 0) {
		for ($i = 0; $i < strlen($data) / 4; $i += 1) {
			$idx = rand(0, strlen($data) - 1);
			$data[$idx] = str_rot13($data[$idx]);
		}
	}

	$corrupt = ($corrupt + 1) % 3;
	return $data;
}

function getCksum($data) {
	$cksum = md5($data);
	return $cksum;
}

$origdata = getData();
$cksum = getCksum($origdata);
echo "Tarkistussumma: " . $cksum . "\n";
echo "Alkuperäinen viesti:\n===\n";
echo $origdata . "\n";

echo "\nTässä välissä tapahtuu jännyyksiä!\n";
fgets(STDIN);

echo "\nOlemme lukevinamme viestin uudestaan\n";
$newdata = getData();
echo "Nyt se näyttää tältä:\n===\n";
echo $newdata . "\n";
$newck = getCksum($newdata);

while ($newck !== $cksum) {
	echo "\nTarkistussummat eivät täsmää!\n";
	echo "Uusi\t$newck !=\nOikea\t$cksum\n";
	echo "Noudetaan viesti uudestaan!\n\n";
	fgets(STDIN);
	$newdata = getData();
	$newck = getCksum($newdata);
	echo "Viesti näyttää tältä:\n===\n";
	echo $newdata . "\n\n";
}

echo "Tarkistussummat täsmäävät!\nUusi\t$newck ==\nOikea\t$cksum\n";
