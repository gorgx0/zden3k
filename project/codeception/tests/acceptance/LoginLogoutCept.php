<?php 
$I = new AcceptanceTester($scenario);
$I->wantTo('perform actions and see result');
$I->amOnPage('/');
$I->fillField('#myusername', 'YT');
$I->fillField('#mypassword', 'PASS');
$I->click('submit');
$I->canSeeElement('#destinationnames');
$I->click('#dropdown01');
$I->click('[href="/Logout"]');
$I->canSeeElement('#myusername');
