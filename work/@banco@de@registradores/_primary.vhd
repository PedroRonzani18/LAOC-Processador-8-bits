library verilog;
use verilog.vl_types.all;
entity BancoDeRegistradores is
    port(
        RegLido1        : in     vl_logic_vector(2 downto 0);
        RegLido2        : in     vl_logic_vector(2 downto 0);
        RegEscr         : in     vl_logic_vector(2 downto 0);
        DadoEscr        : in     vl_logic_vector(7 downto 0);
        Dado1           : out    vl_logic_vector(7 downto 0);
        Dado2           : out    vl_logic_vector(7 downto 0);
        RegWrite        : in     vl_logic;
        Clock           : in     vl_logic
    );
end BancoDeRegistradores;
