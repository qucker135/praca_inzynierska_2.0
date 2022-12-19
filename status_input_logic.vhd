----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.12.2022 16:12:11
-- Design Name: 
-- Module Name: status_input_logic - Behavioral
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

entity status_input_logic is
    Port ( din : in STD_LOGIC_VECTOR (7 downto 0);
           gwe : in STD_LOGIC;
           flags : in STD_LOGIC_VECTOR (2 downto 0);
           we_flags : in STD_LOGIC_VECTOR (2 downto 0);
           cur_status : in STD_LOGIC_VECTOR (7 downto 0);
           dout : out STD_LOGIC_VECTOR (7 downto 0));
end status_input_logic;

architecture Behavioral of status_input_logic is

begin

    process(
        din,
        gwe,
        cur_status
    )
    begin
        if gwe = '1' then
            dout(7 downto 3) <= din(7 downto 3);
        else
            dout(7 downto 3) <= cur_status(7 downto 3);
        end if;
    end process;

    -- Z FLAG SET
    process(
        din,
        gwe,
        flags,
        we_flags,
        cur_status
    )
    begin
        if we_flags(2) = '1' then
            dout(2) <= flags(2);
        elsif gwe = '1' then
            dout(2) <= din(2);
        else
            dout(2) <= cur_status(2);
        end if;
    end process;

    -- DC FLAG SET
    process(
        din,
        gwe,
        flags,
        we_flags,
        cur_status
    )
    begin
        if we_flags(1) = '1' then
            dout(1) <= flags(1);
        elsif gwe = '1' then
            dout(1) <= din(1);
        else
            dout(1) <= cur_status(1);
        end if;
    end process;

    -- C FLAG SET
    process(
        din,
        gwe,
        flags,
        we_flags,
        cur_status
    )
    begin
        if we_flags(0) = '1' then
            dout(0) <= flags(0);
        elsif gwe = '1' then
            dout(0) <= din(0);
        else
            dout(0) <= cur_status(0);
        end if;
    end process;

end Behavioral;
