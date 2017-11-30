<?php

function getData() {
	static $corrupt = false;
	$data = <<<EOF
Tämä on tosi kivaa esimerkkidataa.
Mikäli kaikki tässä maailmassa olisi OK,
ei tämä turmeltuisi kosmisen säteilyn vuoksi.
EOF;
	if ($corrupt) {
		for ($i = 0; $i < strlen($data) / 4; $i += 1) {
			$idx = rand(0, strlen($data) - 1);
			$data[$idx] = str_rot13($data[$idx]);
		}
	}

	$corrupt = !$corrupt;
	return $data;
}

$origdata = getData();
echo "Alkuperäinen viesti:\n===\n";
echo $origdata . "\n";

echo "\nTässä välissä tapahtuu jännyyksiä!\n";
fgets(STDIN);

echo "\nOlemme lukevinamme viestin uudestaan\n";
$newdata = getData();
echo "Nyt se näyttää tältä:\n===\n";
echo $newdata . "\n";
