----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.12.2022 11:56:45
-- Design Name: 
-- Module Name: add8 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity add8 is
    Port ( arg1 : in STD_LOGIC_VECTOR (7 downto 0);
           arg2 : in STD_LOGIC_VECTOR (7 downto 0);
           res : out STD_LOGIC_VECTOR (7 downto 0);
           flags : out STD_LOGIC_VECTOR (2 downto 0));
end add8;

architecture Behavioral of add8 is

    component add4_c_out is
        port(
            arg1 : in STD_LOGIC_VECTOR (3 downto 0);
            arg2 : in STD_LOGIC_VECTOR (3 downto 0);
            res : out STD_LOGIC_VECTOR (3 downto 0);
            c_out : out STD_LOGIC
        );
    end component;
    
    component add4_c_in_c_out is
        port(
            arg1 : in STD_LOGIC_VECTOR (3 downto 0);
            arg2 : in STD_LOGIC_VECTOR (3 downto 0);
            c_in : in STD_LOGIC;
            res : out STD_LOGIC_VECTOR (3 downto 0);
            c_out : out STD_LOGIC
        );
    end component;
    
    signal pom_dc_sig : STD_LOGIC;
    signal pom_res_sig : STD_LOGIC_VECTOR(7 downto 0);

begin

    u_add4_c_out : add4_c_out
    port map(
        arg1 => arg1(3 downto 0),
        arg2 => arg2(3 downto 0),
        res => pom_res_sig(3 downto 0),
        c_out => pom_dc_sig -- DC
    );
    
    u_add4_c_in_c_out : add4_c_in_c_out
    port map(
        arg1 => arg1(7 downto 4),
        arg2 => arg2(7 downto 4),
        c_in => pom_dc_sig,
        res => pom_res_sig(7 downto 4),
        c_out => flags(0) -- C
    );
    
    flags(1) <= pom_dc_sig; -- DC
    res <= pom_res_sig;
    
    process(pom_res_sig)
    begin
        if pom_res_sig = X"00" then
            flags(2) <= '1';
        else
            flags(2) <= '0';
        end if;
    end process;

end Behavioral;
