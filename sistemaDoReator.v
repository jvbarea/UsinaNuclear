module sistemaDoReator (reset, CLOCK, tempRea, inTemp1, inTemp2, inTemp3, inTemp4, outTemp1, outTemp2, outTemp3, outTemp4, portasDeConcreto, sistemaDeVentilacao, alarmeSonoroReator);
    input reset, CLOCK;
    input [8:0] tempRea, inTemp1, inTemp2, inTemp3, inTemp4;
    output [8:0] outTemp1, outTemp2, outTemp3, outTemp4;
    reg [8:0] outTemp1, outTemp2, outTemp3, outTemp4; 
    output reg portasDeConcreto, sistemaDeVentilacao, alarmeSonoroReator;
    parameter [2:0] S;

    always @(posedge CLOCK)
        memoria4x9b memoria(reset, CLOCK, tempRea, inTemp1, inTemp2, inTemp3, inTemp4, outTemp1, outTemp2, outTemp3, outTemp4);
        //media das quatro temperaturas(dividir por 2 == shiftDireita >> 2)
        if((outTemp1 >> 2)+(outTemp2 >> 2)+(outTemp3 >> 2)+(outTemp4 >> 2) >= 300)
            S <= 1'b1;
        else
            S <= 1'b0;    
        SMReator AMS ( CLOCK, S, sistemaRefrigeracao, portasDeConcreto, alarmeSonoroReator);
endmodule

module memoria4x9b (reset, CLOCK, d0, d1, d2, d3, q1, q2, q3, q4);
    input reset, CLOCK;
    input [8:0] d0;
    reg [8:0] q1, q2, q3, q4;

    always @(posedge CLOCK or posedge reset)
        if(reset == 1)
            begin q1 = 0; q1 = 1; q2 = 0; q3 = 0 end
        q4 <= q3;
        q3 <= q2;
        q2 <= q1;
        q1 <= d0;
endmodule    

module SMReator ( CLOCK, S, sistemaRefrigeracao, portasDeConcreto, alarmeSonoroReator);
    input CLOCK, S;
    output reg sistemaRefrigeracao, portasDeConcreto, alarmeSonoroReator;
    reg [2:0] Sreg, Snext;

    parameter [2:0] S0 = 3'b000,
                    S1 = 3'b001,
                    S2 = 3'b010,
                    S3 = 3'b011,
                    S4 = 3'b100;

    always @(posedge CLOCK) begin
        Sreg <=Snext;
    end

    always @(S, Sreg) begin
        case (Sreg)
            S0: if(S==0) Snext = S0;
                else     Snext = S1;
            S1: if(S==0) Snext = S2;
                else     Snext = S3;
            S2: if(S==0) Snext = S0;
                else     Snext = S1;
            S3: if(S==0) Snext = S2;
                else     Snext = S4;
            default: Snext = S0;
        endcase
    end

    always @(Sreg)
        case(Sreg)
            S0 : begin sistemaRefrigeracao = 1'b0; portasDeConcreto = 1'b0; alarmeSonoroReator = 1'b0; end
            S1, S2 : begin sistemaRefrigeracao = 1'b1; portasDeConcreto = 1'b0; alarmeSonoroReator = 1'b0; end
            S3 : begin sistemaRefrigeracao = 1'b1; portasDeConcreto = 1'b1; alarmeSonoroReator = 1'b0; end
            S3 : begin sistemaRefrigeracao = 1'b1; portasDeConcreto = 1'b1; alarmeSonoroReator = 1'b1; end
        endcase
endmodule