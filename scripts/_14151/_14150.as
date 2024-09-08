package _14151
{
   import _14157._14156;
   import com.codeazur.as3swf.SWFData;
   import flash.utils.ByteArray;
   
   public class _14150 implements _14153
   {
      private static const indexAdjustTable2bit:Array = [-1,2,-1,2];
      
      private static const indexAdjustTable3bit:Array = [-1,-1,2,4,-1,-1,2,4];
      
      private static const indexAdjustTable4bit:Array = [-1,-1,-1,-1,2,4,6,8,-1,-1,-1,-1,2,4,6,8];
      
      private static const indexAdjustTable5bit:Array = [-1,-1,-1,-1,-1,-1,-1,-1,1,2,4,6,8,10,13,16,-1,-1,-1,-1,-1,-1,-1,-1,1,2,4,6,8,10,13,16];
      
      private static const stepSizeTable:Array = [7,8,9,10,11,12,13,14,16,17,19,21,23,25,28,31,34,37,41,45,50,55,60,66,73,80,88,97,107,118,130,143,157,173,190,209,230,253,279,307,337,371,408,449,494,544,598,658,724,796,876,963,1060,1166,1282,1411,1552,1707,1878,2066,2272,2499,2749,3024,3327,3660,4026,4428,4871,5358,5894,6484,7132,7845,8630,9493,10442,11487,12635,13899,15289,16818,18500,20350,22385,24623,27086,29794,32767];
      
      private var soundFormat:_14156;
      
      public function _14150(param1:_14156)
      {
         super();
         this.soundFormat = param1;
      }
      
      private static function _15121(param1:int, param2:AdpcmState) : int
      {
         param1 == (param1 & 3);
         var _loc3_:int = int(stepSizeTable[param2.index]);
         var _loc4_:* = _loc3_ >> 1;
         if((param1 & 1) == 1)
         {
            _loc4_ += _loc3_;
         }
         if((param1 & 2) == 2)
         {
            _loc4_ = -_loc4_;
         }
         param2.sample += _loc4_;
         if(param2.sample > 32767)
         {
            param2.sample = 32767;
         }
         else if(param2.sample < -32768)
         {
            param2.sample = -32768;
         }
         param2.index += indexAdjustTable2bit[param1];
         if(param2.index < 0)
         {
            param2.index = 0;
         }
         else if(param2.index > 88)
         {
            param2.index = 88;
         }
         return param2.sample;
      }
      
      private static function _15122(param1:int, param2:AdpcmState) : int
      {
         param1 == (param1 & 7);
         var _loc3_:int = int(stepSizeTable[param2.index]);
         var _loc4_:* = _loc3_ >> 2;
         if((param1 & 1) == 1)
         {
            _loc4_ += _loc3_ >> 1;
         }
         if((param1 & 2) == 2)
         {
            _loc4_ += _loc3_;
         }
         if((param1 & 4) == 4)
         {
            _loc4_ = -_loc4_;
         }
         param2.sample += _loc4_;
         if(param2.sample > 32767)
         {
            param2.sample = 32767;
         }
         else if(param2.sample < -32768)
         {
            param2.sample = -32768;
         }
         param2.index += indexAdjustTable3bit[param1];
         if(param2.index < 0)
         {
            param2.index = 0;
         }
         else if(param2.index > 88)
         {
            param2.index = 88;
         }
         return param2.sample;
      }
      
      private static function _15123(param1:int, param2:AdpcmState) : int
      {
         param1 == (param1 & 0x0F);
         var _loc3_:int = int(stepSizeTable[param2.index]);
         var _loc4_:* = _loc3_ >> 3;
         if((param1 & 1) == 1)
         {
            _loc4_ += _loc3_ >> 2;
         }
         if((param1 & 2) == 2)
         {
            _loc4_ += _loc3_ >> 1;
         }
         if((param1 & 4) == 4)
         {
            _loc4_ += _loc3_;
         }
         if((param1 & 8) == 8)
         {
            _loc4_ = -_loc4_;
         }
         param2.sample += _loc4_;
         if(param2.sample > 32767)
         {
            param2.sample = 32767;
         }
         else if(param2.sample < -32768)
         {
            param2.sample = -32768;
         }
         param2.index += indexAdjustTable4bit[param1];
         if(param2.index < 0)
         {
            param2.index = 0;
         }
         else if(param2.index > 88)
         {
            param2.index = 88;
         }
         return param2.sample;
      }
      
      private static function _15124(param1:int, param2:AdpcmState) : int
      {
         param1 >= 0;
         param1 <= 31;
         var _loc3_:int = int(stepSizeTable[param2.index]);
         var _loc4_:* = _loc3_ >> 4;
         if((param1 & 1) == 1)
         {
            _loc4_ += _loc3_ >> 3;
         }
         if((param1 & 2) == 2)
         {
            _loc4_ += _loc3_ >> 2;
         }
         if((param1 & 4) == 4)
         {
            _loc4_ += _loc3_ >> 1;
         }
         if((param1 & 8) == 8)
         {
            _loc4_ += _loc3_;
         }
         if((param1 & 0x10) == 16)
         {
            _loc4_ = -_loc4_;
         }
         param2.sample += _loc4_;
         if(param2.sample > 32767)
         {
            param2.sample = 32767;
         }
         else if(param2.sample < -32768)
         {
            param2.sample = -32768;
         }
         param2.index += indexAdjustTable5bit[param1];
         if(param2.index < 0)
         {
            param2.index = 0;
         }
         else if(param2.index > 88)
         {
            param2.index = 88;
         }
         return param2.sample;
      }
      
      public function decode(param1:ByteArray) : SWFData
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:AdpcmState = null;
         var _loc11_:AdpcmState = null;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:AdpcmState = null;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc2_:SWFData = new SWFData();
         _loc2_.writeBytes(param1);
         _loc2_.position = 0;
         var _loc3_:int = int(_loc2_.readUB(2));
         var _loc4_:int = _loc3_ + 2;
         var _loc5_:SWFData = new SWFData();
         do
         {
            if(this.soundFormat.stereo)
            {
               _loc6_ = _loc2_.readSB(16);
               _loc7_ = int(_loc2_.readUB(6));
               _loc8_ = _loc2_.readSB(16);
               _loc9_ = int(_loc2_.readUB(6));
               (_loc10_ = new AdpcmState()).index = _loc7_;
               _loc10_.sample = _loc6_;
               (_loc11_ = new AdpcmState()).index = _loc9_;
               _loc11_.sample = _loc8_;
               _loc12_ = 1;
               while(_loc12_ <= 4095 && _loc2_._15058() >= _loc4_ * 2)
               {
                  _loc13_ = int(_loc2_.readUB(_loc4_));
                  _loc14_ = int(_loc2_.readUB(_loc4_));
                  _loc15_ = 0;
                  _loc16_ = 0;
                  switch(_loc4_)
                  {
                     case 2:
                        _loc15_ = _15121(_loc13_,_loc10_);
                        _loc16_ = _15121(_loc14_,_loc11_);
                        break;
                     case 3:
                        _loc15_ = _15122(_loc13_,_loc10_);
                        _loc16_ = _15122(_loc14_,_loc11_);
                        break;
                     case 4:
                        _loc15_ = _15123(_loc13_,_loc10_);
                        _loc16_ = _15123(_loc14_,_loc11_);
                        break;
                     case 5:
                        _loc15_ = _15124(_loc13_,_loc10_);
                        _loc16_ = _15124(_loc14_,_loc11_);
                        break;
                  }
                  _loc5_.writeSI16(_loc15_);
                  _loc5_.writeSI16(_loc16_);
                  _loc12_++;
               }
            }
            else
            {
               _loc17_ = _loc2_.readSB(16);
               _loc18_ = int(_loc2_.readUB(6));
               (_loc19_ = new AdpcmState()).index = _loc18_;
               _loc19_.sample = _loc17_;
               _loc20_ = 1;
               while(_loc20_ <= 4095 && _loc2_._15058() >= _loc4_)
               {
                  _loc21_ = int(_loc2_.readUB(_loc4_));
                  _loc22_ = 0;
                  switch(_loc4_)
                  {
                     case 2:
                        _loc22_ = _15121(_loc21_,_loc19_);
                        break;
                     case 3:
                        _loc22_ = _15122(_loc21_,_loc19_);
                        break;
                     case 4:
                        _loc22_ = _15123(_loc21_,_loc19_);
                        break;
                     case 5:
                        _loc22_ = _15124(_loc21_,_loc19_);
                        break;
                  }
                  _loc5_.writeSI16(_loc22_);
                  _loc20_++;
               }
            }
         }
         while(_loc2_.bytesAvailable > 0);
         
         return _loc5_;
      }
   }
}

class AdpcmState
{
   public var index:int;
   
   public var sample:int;
   
   public function AdpcmState()
   {
      super();
   }
}

