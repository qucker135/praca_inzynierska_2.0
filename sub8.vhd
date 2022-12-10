----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.12.2022 13:42:34
-- Design Name: 
-- Module Name: sub8 - Behavioral
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

entity sub8 is
    Port ( arg1 : in STD_LOGIC_VECTOR (7 downto 0);
           arg2 : in STD_LOGIC_VECTOR (7 downto 0);
           res : out STD_LOGIC_VECTOR (7 downto 0);
           flags : out STD_LOGIC_VECTOR (2 downto 0));
end sub8;

architecture Behavioral of sub8 is

    component sub4_b_out is
        port(
            arg1 : in STD_LOGIC_VECTOR (3 downto 0);
            arg2 : in STD_LOGIC_VECTOR (3 downto 0);
            res : out STD_LOGIC_VECTOR (3 downto 0);
            b_out : out STD_LOGIC
        );
    end component;
    
    component sub4_b_in_b_out is
        port(
            arg1 : in STD_LOGIC_VECTOR (3 downto 0);
            arg2 : in STD_LOGIC_VECTOR (3 downto 0);
            b_in : in STD_LOGIC;
            res : out STD_LOGIC_VECTOR (3 downto 0);
            b_out : out STD_LOGIC
        );
    end component;
    
    signal pom_dc_sig : STD_LOGIC;
    signal pom_res_sig : STD_LOGIC_VECTOR(7 downto 0);

begin

    u_sub4_b_out : sub4_b_out
    port map(
        arg1 => arg1(3 downto 0),
        arg2 => arg2(3 downto 0),
        res => pom_res_sig(3 downto 0),
        b_out => pom_dc_sig -- DC
    );
    
    u_sub4_b_in_b_out : sub4_b_in_b_out
    port map(
        arg1 => arg1(7 downto 4),
        arg2 => arg2(7 downto 4),
        b_in => pom_dc_sig,
        res => pom_res_sig(7 downto 4),
        b_out => flags(0) -- C
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
