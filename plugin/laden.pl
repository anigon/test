#!/usr/bin/perl

use strict;
use warnings;
use lib qw(/home/anigon/plugin);

use Data::Dumper;
use Laden;
use Laden::Artikel::Element::Fisch;
use Laden::Artikel::Element::Fleisch;

my $laden = Laden->new;

my $fisch = Laden::Artikel::Element::Fisch->new;
$fisch->name('Thunfisch');
$fisch->preis(100);
$laden->fisch_list->append($fisch);

$fisch = Laden::Artikel::Element::Fisch->new;
$fisch->name('Aal');
$fisch->preis(180);
$laden->fisch_list->append($fisch);

my $fleisch = Laden::Artikel::Element::Fleisch->new;
$fleisch->name('Rind');
$fleisch->preis(300);
$laden->fleisch_list->append($fleisch);

$fleisch = Laden::Artikel::Element::Fleisch->new;
$fleisch->name('Schwein');
$fleisch->preis(200);
$laden->fleisch_list->append($fleisch);

$laden->fisch_list->exec;
$laden->fleisch_list->exec;

exit;
