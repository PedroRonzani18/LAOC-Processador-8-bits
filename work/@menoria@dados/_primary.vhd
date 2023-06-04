library verilog;
use verilog.vl_types.all;
entity MenoriaDados is
    port(
        Endereco        : in     vl_logic_vector(7 downto 0);
        DadoEscr        : in     vl_logic_vector(7 downto 0);
        DadoLido        : out    vl_logic_vector(7 downto 0);
        MenWrite        : in     vl_logic;
        MenRead         : in     vl_logic;
        Clock           : in     vl_logic
    );
end MenoriaDados;
