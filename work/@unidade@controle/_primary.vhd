library verilog;
use verilog.vl_types.all;
entity UnidadeControle is
    port(
        Opcode          : in     vl_logic_vector(1 downto 0);
        Funct           : in     vl_logic_vector(2 downto 0);
        PCWrite         : out    vl_logic;
        RegOrg1         : out    vl_logic;
        RegOrg2         : out    vl_logic;
        RegDst          : out    vl_logic;
        RegWrite        : out    vl_logic;
        ALUSrc1         : out    vl_logic;
        ALUSrc2         : out    vl_logic_vector(1 downto 0);
        ALUOp           : out    vl_logic_vector(1 downto 0);
        JumpValue       : out    vl_logic_vector(1 downto 0);
        Cond            : out    vl_logic;
        Jump            : out    vl_logic;
        MenWrite        : out    vl_logic;
        MenRead         : out    vl_logic;
        MenToReg        : out    vl_logic
    );
end UnidadeControle;
