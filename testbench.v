`timescale 1 ns / 100 ps
module testbench () ;
reg [7:0] tempA;
reg [3:0] pressaoA;
reg [11:0] radiacaoA;
wire alarme;
integer i , errors;

task Check;
input xpect;
    if ( alarme !== xpect ) begin
        $display (" Error : (temp = %2d, pressao = %b, rad = %b), expect %b, got %b", tempA, pressaoA, radiacaoA, xpect , alarme );
        errors = errors + 1;
    end
endtask

salaDeControle UUT ( .temp( tempA ) , .pressao ( Prime ) , .radiacao( radiacaoA ) , .alarmeSonoroSC( alarme ));

initial begin
    pressaoA = 0;
    radiacaoA = 0;
    errors = 0;
    for(i = 0; i <= 100; i = i + 2) begin 
        tempA = i;
        if(tempA > 40)
            Check(1);
        else Check(0);
    end
    $display("Test Errors, %2d errors", errors);
end
endmodule