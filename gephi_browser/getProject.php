<?php 
	$mode=$_GET["mode"];
    // integer starts at 0 before counting
    $i = 0; 
    $dir = 'C:/xampp/htdocs/gephi_browser/'.$mode.'/';
	$d="";
	if($mode!="Gexf Export") {
	$directories = glob($dir . '/*' , GLOB_ONLYDIR);
	
	
	for ($i = 0;$i<count($directories) ; $i++) {
		$d=$d."!".explode("//",$directories[$i])[1];
}
}
else{
$directories = glob($dir . '/*.gexf');
for ($i = 0;$i<count($directories) ; $i++) {
		$d=$d."!".explode(".gexf",explode("//",$directories[$i])[1])[0];
}
}
	
print_r($d);
?>
