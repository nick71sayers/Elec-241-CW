module task1_tb;

logic AA;
logic BB;
logic CC;
logic QQ;
logic PP;

//module task1a (input logic A, input logic B, input logic C, output logic P);
task1a u1(AA,BB,CC,PP);     //Instantiate task1a and b        

//module task1b (input logic A, input logic B, input logic C, output logic Q);
task1b u2(AA,BB,CC,QQ);

initial         //test each input variation and confirm the outputs
begin
	//test 1
	AA = 0;        //set inputs
	BB = 0;
	CC = 0;
	#10ps;
	assert (PP == 0)$display("PP PASS"); 
	else $error("PP FAIL");       // check for correct output
	$display(" QQ dont care ");                                      //cant check for identical as dont care for QQ
	
	//test 2
	AA = 0;        //set inputs
	BB = 0;
	CC = 1;
	#10ps;
	assert (PP == 1)$display("PP PASS"); 
	else $error("PP FAIL");       // check for correct output
	assert (QQ == 1)$display("QQ PASS"); 
	else $error("QQ FAIL");
	if (PP == QQ) $display(" Both have identical outputs "); 
	else $error(" Error outputs not identical "); //check if outputs are identical
	
	
	//test 3
	AA = 0;        //set inputs
	BB = 1;
	CC = 0;
	#10ps;
	assert (PP == 0)$display("PP PASS"); 
	else $error("PP FAIL");         // check for correct output
	assert (QQ == 1)$display("QQ PASS"); 
	else $error("QQ FAIL");
	if (PP == QQ) $display(" Both have identical outputs "); 
	else $error(" Error outputs not identical ");  //check if outputs are identical
	
	//test 4
	AA = 0;        //set inputs
	BB = 1;
	CC = 1;
	#10ps;
	assert (PP == 0)$display("PP PASS"); 
	else $error("PP FAIL");       // check for correct output
	assert (QQ == 0)$display("QQ PASS"); 
	else $error("QQ FAIL");
	if (PP == QQ) $display(" Both have identical outputs "); 
	else $error(" Error outputs not identical "); //check if outputs are identical
 	
	//test 5
	AA = 1;        //set inputs
	BB = 0;
	CC = 0;
	#10ps;
	assert (PP == 1)$display("PP PASS"); 
	else $error("PP FAIL");         // check for correct output
	assert (QQ == 0)$display("QQ PASS"); 
	else $error("QQ FAIL");
	if (PP == QQ) $display(" Both have identical outputs "); 
	else $error(" Error outputs not identical "); //check if outputs are identical
	
	//test 6
	AA = 1;        //set inputs
	BB = 0;
	CC = 1;
	#10ps;
	assert (PP == 1)$display("PP PASS"); 
	else $error("PP FAIL");       // check for correct output
	assert (QQ == 0)$display("QQ PASS"); 
	else $error("QQ FAIL");
	if (PP == QQ) $display(" Both have identical outputs "); 
	else $error(" Error outputs not identical "); //check if outputs are identical
	
	//test 7
	AA = 1;        //set inputs
	BB = 1;
	CC = 0;
	#10ps;
	assert (PP == 0)$display("PP PASS"); 
	else $error("PP FAIL");        // check for correct output
	assert (QQ == 0)$display("QQ PASS"); 
	else $error("QQ FAIL");
	if (PP == QQ) $display(" Both have identical outputs "); 
	else $error(" Error outputs not identical "); //check if outputs are identical
	 
	//test 8
	AA = 1;        //set inputs
	BB = 1;
	CC = 1;
	#10ps;
	assert (PP == 0)$display("PP PASS"); 
	else $error("PP FAIL");           // check for correct output
	assert (QQ == 0)$display("QQ PASS"); 
	else $error("QQ FAIL");
	if (PP == QQ) $display(" Both have identical outputs "); 
	else $error(" Error outputs not identical "); //check if outputs are identical	
end

end module
	

