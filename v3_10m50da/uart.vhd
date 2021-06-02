----------------------------------------------------
-- UART RS232
-- Ver. 1.0    - 10.07.2003
---------------------------------------------------

library ieee;
use IEEE.STD_LOGIC_1164.all;
USE IEEE.numeric_std.all;
--use altera.altera_primitives_components.all;

entity UART is
generic (UART_Speed : integer := 115200 ;   -- UART Speed
          System_CLK : integer := 50000000    -- System CLK in Hz 
      );

port (
      CLK      : in std_logic;       -- system clk
      RST_N    : in std_logic;       -- system reset#
      DATA_IN  : in std_logic_vector(7 downto 0); -- Transmit data
      --DIR      : in std_logic;      -- 1-TRANSMIT   0-RECIEVE
      
      DATA_OUT : out std_logic_vector(7 downto 0); --Recieved data LSB left
      --DATA_OUT : out std_logic_vector(0 to 7); --Recieved data  MSB left
      RX_VALID : out std_logic;    -- RX buffer data ready
      
      TX_VALID : in  std_logic;         -- Data for TX avaible
      
      RX_D  : in  std_logic;           -- RX pin
      TX_D  : out  std_logic;           -- TX pin
      
      TX_BUSY  : out std_logic;    -- TX pin
      RX_BUSY  : out std_logic
);
end UART;

---------------------------------------------------
-- Architecture for UART
---------------------------------------------------
architecture rtl of UART is

signal TxBuf   : Std_Logic_Vector(7 downto 0); -- transmit buffer
signal RxBuf   : Std_Logic_Vector(7 downto 0); -- recieve buffer   LSB left
--signal RxBuf   : Std_Logic_Vector(0 to 7); -- recieve buffer     MSB left
signal prevRXD : Std_Logic;           -- RXD buffer register
signal RxReady : Std_Logic;
signal TXRead  : Std_Logic;
signal TxBitCnt : integer range 0 to 9;
signal TxReady : Std_Logic;
signal CntRX : integer range 0 to System_CLK/(UART_Speed);
signal CntTX : integer range 0 to System_CLK/(UART_Speed); 
signal RxBitCnt: integer range 0 to 10;

begin


UART_Tx: process(CLK, RST_N)

begin
  if RST_N='0' then
    TX_D <= '1';
    TxBitCnt <= 0;
    TxBuf <= (others => '0');
    CntTX <= 0;
    TxReady <= '1';
  elsif (rising_edge(CLK)) then
    if (TX_VALID = '1' and TxReady = '1') then
      TxBuf(7 downto 0) <= DATA_IN(7 downto 0);
      TxReady <= '0';
      TxBitCnt <= 0;
      CntTX  <= 0;
    end if;

    if (TxReady = '0') then
      if CntTX=(System_CLK/(UART_Speed)) then
        CntTX <= 0;
        case TxBitCnt is
          when 0 =>
            TX_D  <=  '0';       -- start bit
            TxBitCnt <= TxBitCnt+1;
          when 1|2|3|4|5|6|7|8 =>
            TX_D      <= TxBuf(0);
            TxBuf    <= '0' & TxBuf(7 downto 1);
            TxBitCnt <= TxBitCnt+1;
          when 9 =>
            TX_D      <= '1';    -- stop bit
            TxBuf    <= (others => '0');
            TxBitCnt <= 0;
            TxReady  <= '1';        
        end case;
      else
        CntTX <= CntTX+1;
      end if;
    end if;
  end if;
end process UART_Tx;
TX_BUSY <= not (TxReady);



UART_Rx: process(CLK, RST_N)
begin
  if RST_N='0' then
    RxBitCnt <=0;
    RxBuf <= (others => '0');
    RxReady <= '1';
    prevRXD <= '1';
    CntRX <= 0;
  elsif (rising_edge(CLK)) then
    if (RxReady = '1') then
      prevRXD <= RX_D;
      if (RX_D='0' and prevRXD='1') then  -- Start bit,
        RxBitCnt <= 0;              -- RX Bit counter
        RxReady <= '0'; -- Start receiving
        RxBuf <= (others => '0');
        CntRX <= 0;
      end if;
    else
      if CntRX=(System_CLK/(UART_Speed*2)) then
        case RxBitCnt is
          when 0 =>
            if (RX_D='1') then -- start bit failed
              RxReady <= '1';
            end if;
          when 1|2|3|4|5|6|7|8 =>
            --RxBuf <= RX_D & RxBuf(0 to 6);		  -- MSB left
            RxBuf <= RX_D & RxBuf(7 downto 1);    	  -- LSB left
            RxReady <= '0';
          when 9 =>
            RxReady <= '1';
          when others => RxReady <= '0';
        end case;
        CntRX <= CntRX+1;
        RxBitCnt <= RxBitCnt+1;
      elsif (CntRX=(System_CLK/(UART_Speed))) then
        CntRX <= 0;
      else
        CntRX <= CntRX+1;
      end if;
    end if;
  end if;
end process UART_Rx;

DATA_OUT(7 downto 0) <=  RxBuf(7 downto 0) when RxReady='1' 	-- LSB left
--DATA_OUT(0 to 7) <=  RxBuf(0 to 7) when RxReady='1' 			-- MSB left
          else (others => '0');
RX_VALID <= RxReady;
RX_BUSY  <= not (RxReady);

end rtl;