


print "Hello World!\n";

my $pmFile = "99_my01_config_Utils.pm";

###
# Handy Konfiguration
###
my %configHandy = (
    mirko => {
        name      => 'Mirko\'s Handy',
        bluetooth => 2, 
        three     => 3,
    },
    melanie => {
        name      => 'Melanie\'s Handy', 
        bluetooth => 22, 
        three     => 33,
    },
);
my $rhConfigHandy = \%configHandy;






###
# Handy Konfiguration
###
my %configLicht = (
    'onForTimer' => (5 * 60),
	'onForTimer.flur' => (5 * 60), 
);
my $rhConfigLicht = \%configLicht;

# "onForTimer.flur.eg.deckenlicht"


###
# Gesamt Konfiguration
###
my %configDaten = (
  OnForTimer => (5 * 60) ,
  Zahl       => 123,
  Ort        => 'Berlin',
  handy => $rhConfigHandy,
  licht => $rhConfigLicht,
);
my $rhConfig = \%configDaten;


sub my01_config_Utils_Initialize($$) {
  my ($hash) = @_;
  print "$pmFile: #myConfig_Utils_Initialize() !!!"; 
}

# Enter you functions below _this_ line.

sub getConfig($;$) {
  	my ($arg, $arg2) = @_;

	print "sub getConfig: arg=$arg\n";
	
	my $val = '';
	
	my $name = $arg;
	my @names = split('\.', $name);
	
	my $rh = $rhConfig;
	if (ref $arg2 eq ref {}) {
	    $rh = $arg2;
	}

	if (scalar(@names) == 1) {
	    
        if (exists $rh{$name}) {
            $val = $rh->{$name};
        } else {
            print "sub getConfig: No value found for name=$name\n";
        }
	} else {
	    
	}

	print "sub getConfig: $val=$val\n";
	return $val;
}

#getConfig('OnForTimer');
getConfig('licht.onForTimer.xxx');
getConfig('licht');



