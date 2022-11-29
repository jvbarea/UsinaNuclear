`timescale 1 ns / 100 ps
module testbench ();
reg [3:0] presSC, presS1, presS2, presS3, presTubSR, presTubSS, presRea;
wire alarme, damperS12A, damperS23A, damperS3SSA, damperS3SRA, damperSSSCA, damperRSRA;
integer i, errors;

task Check;
input xpect;
    if ( alarme !== xpect ) begin
        $display (" Error : expect %b, got %b", xpect , alarme );
        errors = errors + 1;
end
endtask

sistemaDeVentilacao UUT ( .sensPresSC(presSC), .sensPresS1(presS1), .sensPresS2(presS2), .sensPresS3(presS3), .sensPresTubSR(presTubSR), .sensPresTubSS(presTubSS), .sensPresRea(presRea), .alarmeSonoroVentilacao(alarme), .damperS12(damperS12A), .damperS23(damperS23A), .damperS3SS(damperS3SSA), .damperS3SR(damperS3SRA), .damperSSSC(damperSSSCA), .damperRSR(damperRSRA) );

initial
begin
    
end
endmodule