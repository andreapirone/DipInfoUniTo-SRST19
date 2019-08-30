#!/usr/bin/perl

$fileCONLL =$ARGV[0];

open(CFILE, "$fileCONLL");     

while($cline = <CFILE>)
{
    #print "DEBUG::\n";
    if($cline =~ /^([^\t]+)\t([^\t]*)\t([^\t]+)\t([^\t]+)\t([^\t]+)\t([^\t]+)\t([^\t]+)\t([^\t]+)\t([^\t]+)\t([^\t]+)\n$/)
    {
	$number = $1;
	$form   = $2;
	$lemma  = $3;    
	$uPoS = $4;
	$xPoS = $5;
	$feats = $6;
	$parent   = $7;
	$relation = $8;    
	$end1 = $9;
	$end2 = $10;

	#print "DEBUG:::form==". $form . "\n";
	if($form =~ /^$/)
	{
	    $form = $lemma;
	}

	print $number . "\t". $form . "\t". $lemma . "\t".  $uPoS . "\t". $xPoS . "\t". $feats . "\t". $parent . "\t". $relation . "\t". $end1 . "\t". $end2 . "\n";
    }	     
    else
    {
	print $cline;
    }
}
close(CFILE);
