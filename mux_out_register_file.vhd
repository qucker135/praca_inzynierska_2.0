----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.12.2022 13:14:58
-- Design Name: 
-- Module Name: mux_we_register_file - Behavioral
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

use work.mux_out_register_file_types.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux_out_register_file is 
    Port ( reg_out : in mux_input_type;
           addr_in : in STD_LOGIC_VECTOR(8 downto 0);
           mux_out : out STD_LOGIC_VECTOR(7 downto 0));
end mux_out_register_file;

architecture Behavioral of mux_out_register_file is

begin
    
    process(
        reg_out,
        addr_in
    )
    begin
        case addr_in is
            when B"0_0000_0001" | B"1_0000_0001" =>
                mux_out <= reg_out(0); -- TMR0
            when B"0_1000_0001" | B"1_1000_0001" =>
                mux_out <= reg_out(1); -- OPTION
            when B"0_0000_0010" | B"0_1000_0010" | B"1_0000_0010" | B"1_1000_0010" =>
                mux_out <= reg_out(2); -- PCL
            when B"0_0000_0011" | B"0_1000_0011" | B"1_0000_0011" | B"1_1000_0011" =>
                mux_out <= reg_out(3); -- STATUS
            when B"0_0000_0100" | B"0_1000_0100" | B"1_0000_0100" | B"1_1000_0100" =>
                mux_out <= reg_out(4); -- FSR
            when B"0_0000_0101" =>
                mux_out <= reg_out(5); -- PORTA
            when B"0_1000_0101" =>
                mux_out <= reg_out(6); -- TRISA
            when B"0_0000_0110" | B"1_0000_0110" =>
                mux_out <= reg_out(7); -- PORTB
            when B"0_1000_0110" | B"1_1000_0110" =>
                mux_out <= reg_out(8); -- TRISB
            when B"0_0000_0111" =>
                mux_out <= reg_out(9); -- PORTC
            when B"0_1000_0111" =>
                mux_out <= reg_out(10); -- TRISC
            when B"0_0000_1010" | B"0_1000_1010" | B"1_0000_1010" | B"1_1000_1010" =>
                mux_out <= reg_out(11); -- PCLATH
            when B"0_0000_1011" | B"0_1000_1011" | B"1_0000_1011" | B"1_1000_1011" =>
                mux_out <= reg_out(12); -- INTCON
            when B"0_0000_1100" =>
                mux_out <= reg_out(13); -- PIR1
            when B"0_1000_1100" =>
                mux_out <= reg_out(14); -- PIE1
            when B"1_0000_1100" =>
                mux_out <= reg_out(15); -- PMDATL
            when B"1_1000_1100" =>
                mux_out <= reg_out(16); -- PMCON1
            when B"1_0000_1101" =>
                mux_out <= reg_out(17); -- PMADRL
            when B"0_0000_1110" =>
                mux_out <= reg_out(18); -- TMR1L
            when B"0_1000_1110" =>
                mux_out <= reg_out(19); -- PCON
            when B"1_0000_1110" =>
                mux_out <= reg_out(20); -- PMDATH
            when B"0_0000_1111" =>
                mux_out <= reg_out(21); -- TMR1H
            when B"1_0000_1111" =>
                mux_out <= reg_out(22); -- PMADRH
            when B"0_0001_0000" =>
                mux_out <= reg_out(23); -- T1CON
            when B"0_0001_0001" =>
                mux_out <= reg_out(24); -- TMR2
            when B"0_0001_0010" =>
                mux_out <= reg_out(25); -- T2CON
            when B"0_1001_0010" =>
                mux_out <= reg_out(26); -- PR2
            when B"0_0001_0011" =>
                mux_out <= reg_out(27); -- SSPBUF
            when B"0_1001_0011" =>
                mux_out <= reg_out(28); -- SSPADD
            when B"0_0001_0100" =>
                mux_out <= reg_out(29); -- SSPCON
            when B"0_1001_0100" =>
                mux_out <= reg_out(30); -- SSPSTAT
            when B"0_0001_0101" =>
                mux_out <= reg_out(31); -- CCPR1L
            when B"0_0001_0110" =>
                mux_out <= reg_out(32); -- CCPR1H
            when B"0_0001_0111" =>
                mux_out <= reg_out(33); -- CCP1CON
            when B"0_0001_1110" =>
                mux_out <= reg_out(34); -- ADRES
            when B"0_0001_1111" =>
                mux_out <= reg_out(35); -- ADCON0
            when B"0_1001_1111" =>
                mux_out <= reg_out(36); -- ADCON1
            -- GPRB0 (double access)
            when B"0_0010_0000" | B"1_0010_0000" =>
                mux_out <= reg_out(37);
            when B"0_0010_0001" | B"1_0010_0001" =>
                mux_out <= reg_out(38);
            when B"0_0010_0010" | B"1_0010_0010" =>
                mux_out <= reg_out(39);
            when B"0_0010_0011" | B"1_0010_0011" =>
                mux_out <= reg_out(40);
            when B"0_0010_0100" | B"1_0010_0100" =>
                mux_out <= reg_out(41);
            when B"0_0010_0101" | B"1_0010_0101" =>
                mux_out <= reg_out(42);
            when B"0_0010_0110" | B"1_0010_0110" =>
                mux_out <= reg_out(43);
            when B"0_0010_0111" | B"1_0010_0111" =>
                mux_out <= reg_out(44);
            when B"0_0010_1000" | B"1_0010_1000" =>
                mux_out <= reg_out(45);
            when B"0_0010_1001" | B"1_0010_1001" =>
                mux_out <= reg_out(46);
            when B"0_0010_1010" | B"1_0010_1010" =>
                mux_out <= reg_out(47);
            when B"0_0010_1011" | B"1_0010_1011" =>
                mux_out <= reg_out(48);
            when B"0_0010_1100" | B"1_0010_1100" =>
                mux_out <= reg_out(49);
            when B"0_0010_1101" | B"1_0010_1101" =>
                mux_out <= reg_out(50);
            when B"0_0010_1110" | B"1_0010_1110" =>
                mux_out <= reg_out(51);
            when B"0_0010_1111" | B"1_0010_1111" =>
                mux_out <= reg_out(52);
            when B"0_0011_0000" | B"1_0011_0000" =>
                mux_out <= reg_out(53);
            when B"0_0011_0001" | B"1_0011_0001" =>
                mux_out <= reg_out(54);
            when B"0_0011_0010" | B"1_0011_0010" =>
                mux_out <= reg_out(55);
            when B"0_0011_0011" | B"1_0011_0011" =>
                mux_out <= reg_out(56);
            when B"0_0011_0100" | B"1_0011_0100" =>
                mux_out <= reg_out(57);
            when B"0_0011_0101" | B"1_0011_0101" =>
                mux_out <= reg_out(58);
            when B"0_0011_0110" | B"1_0011_0110" =>
                mux_out <= reg_out(59);
            when B"0_0011_0111" | B"1_0011_0111" =>
                mux_out <= reg_out(60);
            when B"0_0011_1000" | B"1_0011_1000" =>
                mux_out <= reg_out(61);
            when B"0_0011_1001" | B"1_0011_1001" =>
                mux_out <= reg_out(62);
            when B"0_0011_1010" | B"1_0011_1010" =>
                mux_out <= reg_out(63);
            when B"0_0011_1011" | B"1_0011_1011" =>
                mux_out <= reg_out(64);
            when B"0_0011_1100" | B"1_0011_1100" =>
                mux_out <= reg_out(65);
            when B"0_0011_1101" | B"1_0011_1101" =>
                mux_out <= reg_out(66);
            when B"0_0011_1110" | B"1_0011_1110" =>
                mux_out <= reg_out(67);
            when B"0_0011_1111" | B"1_0011_1111" =>
                mux_out <= reg_out(68);
            -- GPRB0 (quadruple access)
            when B"0_0100_0000" | B"0_1100_0000" | B"1_0100_0000" | B"1_1100_0000" =>
                mux_out <= reg_out(69);
            when B"0_0100_0001" | B"0_1100_0001" | B"1_0100_0001" | B"1_1100_0001" =>
                mux_out <= reg_out(70);
            when B"0_0100_0010" | B"0_1100_0010" | B"1_0100_0010" | B"1_1100_0010" =>
                mux_out <= reg_out(71);
            when B"0_0100_0011" | B"0_1100_0011" | B"1_0100_0011" | B"1_1100_0011" =>
                mux_out <= reg_out(72);
            when B"0_0100_0100" | B"0_1100_0100" | B"1_0100_0100" | B"1_1100_0100" =>
                mux_out <= reg_out(73);
            when B"0_0100_0101" | B"0_1100_0101" | B"1_0100_0101" | B"1_1100_0101" =>
                mux_out <= reg_out(74);
            when B"0_0100_0110" | B"0_1100_0110" | B"1_0100_0110" | B"1_1100_0110" =>
                mux_out <= reg_out(75);
            when B"0_0100_0111" | B"0_1100_0111" | B"1_0100_0111" | B"1_1100_0111" =>
                mux_out <= reg_out(76);
            when B"0_0100_1000" | B"0_1100_1000" | B"1_0100_1000" | B"1_1100_1000" =>
                mux_out <= reg_out(77);
            when B"0_0100_1001" | B"0_1100_1001" | B"1_0100_1001" | B"1_1100_1001" =>
                mux_out <= reg_out(78);
            when B"0_0100_1010" | B"0_1100_1010" | B"1_0100_1010" | B"1_1100_1010" =>
                mux_out <= reg_out(79);
            when B"0_0100_1011" | B"0_1100_1011" | B"1_0100_1011" | B"1_1100_1011" =>
                mux_out <= reg_out(80);
            when B"0_0100_1100" | B"0_1100_1100" | B"1_0100_1100" | B"1_1100_1100" =>
                mux_out <= reg_out(81);
            when B"0_0100_1101" | B"0_1100_1101" | B"1_0100_1101" | B"1_1100_1101" =>
                mux_out <= reg_out(82);
            when B"0_0100_1110" | B"0_1100_1110" | B"1_0100_1110" | B"1_1100_1110" =>
                mux_out <= reg_out(83);
            when B"0_0100_1111" | B"0_1100_1111" | B"1_0100_1111" | B"1_1100_1111" =>
                mux_out <= reg_out(84);
            when B"0_0101_0000" | B"0_1101_0000" | B"1_0101_0000" | B"1_1101_0000" =>
                mux_out <= reg_out(85);
            when B"0_0101_0001" | B"0_1101_0001" | B"1_0101_0001" | B"1_1101_0001" =>
                mux_out <= reg_out(86);
            when B"0_0101_0010" | B"0_1101_0010" | B"1_0101_0010" | B"1_1101_0010" =>
                mux_out <= reg_out(87);
            when B"0_0101_0011" | B"0_1101_0011" | B"1_0101_0011" | B"1_1101_0011" =>
                mux_out <= reg_out(88);
            when B"0_0101_0100" | B"0_1101_0100" | B"1_0101_0100" | B"1_1101_0100" =>
                mux_out <= reg_out(89);
            when B"0_0101_0101" | B"0_1101_0101" | B"1_0101_0101" | B"1_1101_0101" =>
                mux_out <= reg_out(90);
            when B"0_0101_0110" | B"0_1101_0110" | B"1_0101_0110" | B"1_1101_0110" =>
                mux_out <= reg_out(91);
            when B"0_0101_0111" | B"0_1101_0111" | B"1_0101_0111" | B"1_1101_0111" =>
                mux_out <= reg_out(92);
            when B"0_0101_1000" | B"0_1101_1000" | B"1_0101_1000" | B"1_1101_1000" =>
                mux_out <= reg_out(93);
            when B"0_0101_1001" | B"0_1101_1001" | B"1_0101_1001" | B"1_1101_1001" =>
                mux_out <= reg_out(94);
            when B"0_0101_1010" | B"0_1101_1010" | B"1_0101_1010" | B"1_1101_1010" =>
                mux_out <= reg_out(95);
            when B"0_0101_1011" | B"0_1101_1011" | B"1_0101_1011" | B"1_1101_1011" =>
                mux_out <= reg_out(96);
            when B"0_0101_1100" | B"0_1101_1100" | B"1_0101_1100" | B"1_1101_1100" =>
                mux_out <= reg_out(97);
            when B"0_0101_1101" | B"0_1101_1101" | B"1_0101_1101" | B"1_1101_1101" =>
                mux_out <= reg_out(98);
            when B"0_0101_1110" | B"0_1101_1110" | B"1_0101_1110" | B"1_1101_1110" =>
                mux_out <= reg_out(99);
            when B"0_0101_1111" | B"0_1101_1111" | B"1_0101_1111" | B"1_1101_1111" =>
                mux_out <= reg_out(100);
            when B"0_0110_0000" | B"0_1110_0000" | B"1_0110_0000" | B"1_1110_0000" =>
                mux_out <= reg_out(101);
            when B"0_0110_0001" | B"0_1110_0001" | B"1_0110_0001" | B"1_1110_0001" =>
                mux_out <= reg_out(102);
            when B"0_0110_0010" | B"0_1110_0010" | B"1_0110_0010" | B"1_1110_0010" =>
                mux_out <= reg_out(103);
            when B"0_0110_0011" | B"0_1110_0011" | B"1_0110_0011" | B"1_1110_0011" =>
                mux_out <= reg_out(104);
            when B"0_0110_0100" | B"0_1110_0100" | B"1_0110_0100" | B"1_1110_0100" =>
                mux_out <= reg_out(105);
            when B"0_0110_0101" | B"0_1110_0101" | B"1_0110_0101" | B"1_1110_0101" =>
                mux_out <= reg_out(106);
            when B"0_0110_0110" | B"0_1110_0110" | B"1_0110_0110" | B"1_1110_0110" =>
                mux_out <= reg_out(107);
            when B"0_0110_0111" | B"0_1110_0111" | B"1_0110_0111" | B"1_1110_0111" =>
                mux_out <= reg_out(108);
            when B"0_0110_1000" | B"0_1110_1000" | B"1_0110_1000" | B"1_1110_1000" =>
                mux_out <= reg_out(109);
            when B"0_0110_1001" | B"0_1110_1001" | B"1_0110_1001" | B"1_1110_1001" =>
                mux_out <= reg_out(110);
            when B"0_0110_1010" | B"0_1110_1010" | B"1_0110_1010" | B"1_1110_1010" =>
                mux_out <= reg_out(111);
            when B"0_0110_1011" | B"0_1110_1011" | B"1_0110_1011" | B"1_1110_1011" =>
                mux_out <= reg_out(112);
            when B"0_0110_1100" | B"0_1110_1100" | B"1_0110_1100" | B"1_1110_1100" =>
                mux_out <= reg_out(113);
            when B"0_0110_1101" | B"0_1110_1101" | B"1_0110_1101" | B"1_1110_1101" =>
                mux_out <= reg_out(114);
            when B"0_0110_1110" | B"0_1110_1110" | B"1_0110_1110" | B"1_1110_1110" =>
                mux_out <= reg_out(115);
            when B"0_0110_1111" | B"0_1110_1111" | B"1_0110_1111" | B"1_1110_1111" =>
                mux_out <= reg_out(116);
            when B"0_0111_0000" | B"0_1111_0000" | B"1_0111_0000" | B"1_1111_0000" =>
                mux_out <= reg_out(117);
            when B"0_0111_0001" | B"0_1111_0001" | B"1_0111_0001" | B"1_1111_0001" =>
                mux_out <= reg_out(118);
            when B"0_0111_0010" | B"0_1111_0010" | B"1_0111_0010" | B"1_1111_0010" =>
                mux_out <= reg_out(119);
            when B"0_0111_0011" | B"0_1111_0011" | B"1_0111_0011" | B"1_1111_0011" =>
                mux_out <= reg_out(120);
            when B"0_0111_0100" | B"0_1111_0100" | B"1_0111_0100" | B"1_1111_0100" =>
                mux_out <= reg_out(121);
            when B"0_0111_0101" | B"0_1111_0101" | B"1_0111_0101" | B"1_1111_0101" =>
                mux_out <= reg_out(122);
            when B"0_0111_0110" | B"0_1111_0110" | B"1_0111_0110" | B"1_1111_0110" =>
                mux_out <= reg_out(123);
            when B"0_0111_0111" | B"0_1111_0111" | B"1_0111_0111" | B"1_1111_0111" =>
                mux_out <= reg_out(124);
            when B"0_0111_1000" | B"0_1111_1000" | B"1_0111_1000" | B"1_1111_1000" =>
                mux_out <= reg_out(125);
            when B"0_0111_1001" | B"0_1111_1001" | B"1_0111_1001" | B"1_1111_1001" =>
                mux_out <= reg_out(126);
            when B"0_0111_1010" | B"0_1111_1010" | B"1_0111_1010" | B"1_1111_1010" =>
                mux_out <= reg_out(127);
            when B"0_0111_1011" | B"0_1111_1011" | B"1_0111_1011" | B"1_1111_1011" =>
                mux_out <= reg_out(128);
            when B"0_0111_1100" | B"0_1111_1100" | B"1_0111_1100" | B"1_1111_1100" =>
                mux_out <= reg_out(129);
            when B"0_0111_1101" | B"0_1111_1101" | B"1_0111_1101" | B"1_1111_1101" =>
                mux_out <= reg_out(130);
            when B"0_0111_1110" | B"0_1111_1110" | B"1_0111_1110" | B"1_1111_1110" =>
                mux_out <= reg_out(131);
            when B"0_0111_1111" | B"0_1111_1111" | B"1_0111_1111" | B"1_1111_1111" =>
                mux_out <= reg_out(132);
            -- GPRB1 (double access)
            when B"0_1010_0000" | B"1_1010_0000" =>
                mux_out <= reg_out(133);
            when B"0_1010_0001" | B"1_1010_0001" =>
                mux_out <= reg_out(134);
            when B"0_1010_0010" | B"1_1010_0010" =>
                mux_out <= reg_out(135);
            when B"0_1010_0011" | B"1_1010_0011" =>
                mux_out <= reg_out(136);
            when B"0_1010_0100" | B"1_1010_0100" =>
                mux_out <= reg_out(137);
            when B"0_1010_0101" | B"1_1010_0101" =>
                mux_out <= reg_out(138);
            when B"0_1010_0110" | B"1_1010_0110" =>
                mux_out <= reg_out(139);
            when B"0_1010_0111" | B"1_1010_0111" =>
                mux_out <= reg_out(140);
            when B"0_1010_1000" | B"1_1010_1000" =>
                mux_out <= reg_out(141);
            when B"0_1010_1001" | B"1_1010_1001" =>
                mux_out <= reg_out(142);
            when B"0_1010_1010" | B"1_1010_1010" =>
                mux_out <= reg_out(143);
            when B"0_1010_1011" | B"1_1010_1011" =>
                mux_out <= reg_out(144);
            when B"0_1010_1100" | B"1_1010_1100" =>
                mux_out <= reg_out(145);
            when B"0_1010_1101" | B"1_1010_1101" =>
                mux_out <= reg_out(146);
            when B"0_1010_1110" | B"1_1010_1110" =>
                mux_out <= reg_out(147);
            when B"0_1010_1111" | B"1_1010_1111" =>
                mux_out <= reg_out(148);
            when B"0_1011_0000" | B"1_1011_0000" =>
                mux_out <= reg_out(149);
            when B"0_1011_0001" | B"1_1011_0001" =>
                mux_out <= reg_out(150);
            when B"0_1011_0010" | B"1_1011_0010" =>
                mux_out <= reg_out(151);
            when B"0_1011_0011" | B"1_1011_0011" =>
                mux_out <= reg_out(152);
            when B"0_1011_0100" | B"1_1011_0100" =>
                mux_out <= reg_out(153);
            when B"0_1011_0101" | B"1_1011_0101" =>
                mux_out <= reg_out(154);
            when B"0_1011_0110" | B"1_1011_0110" =>
                mux_out <= reg_out(155);
            when B"0_1011_0111" | B"1_1011_0111" =>
                mux_out <= reg_out(156);
            when B"0_1011_1000" | B"1_1011_1000" =>
                mux_out <= reg_out(157);
            when B"0_1011_1001" | B"1_1011_1001" =>
                mux_out <= reg_out(158);
            when B"0_1011_1010" | B"1_1011_1010" =>
                mux_out <= reg_out(159);
            when B"0_1011_1011" | B"1_1011_1011" =>
                mux_out <= reg_out(160);
            when B"0_1011_1100" | B"1_1011_1100" =>
                mux_out <= reg_out(161);
            when B"0_1011_1101" | B"1_1011_1101" =>
                mux_out <= reg_out(162);
            when B"0_1011_1110" | B"1_1011_1110" =>
                mux_out <= reg_out(163);
            when B"0_1011_1111" | B"1_1011_1111" =>
                mux_out <= reg_out(164);
            when others =>
                mux_out <= (others => '0');
        end case;
    end process;
    
end Behavioral;
