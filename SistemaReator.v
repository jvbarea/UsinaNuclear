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