package _14151
{
   import flash.utils.ByteArray;
   
   public class _14152
   {
      private static const bandBound:Array = [0,2,4,6,8,10,12,14,16,18,21,24,28,32,37,43,49,56,64,73,83,95,109,124];
      
      private static const gainBit:Array = [6,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,0,0,0,0,0,0,0,0,0];
      
      private static const table0:Array = [2,2,2,2,2,2,2,2,2,3,3,4,4,5,6,6,7,8,9,10,12,14,15,0];
      
      private static const table1:Array = [3134,5342,6870,7792,8569,9185,9744,10191,10631,11061,11434,11770,12116,12513,12925,13300,13674,14027,14352,14716,15117,15477,15824,16157,16513,16804,17090,17401,17679,17948,18238,18520,18764,19078,19381,19640,19921,20205,20500,20813,21162,21465,21794,22137,22453,22756,23067,23350,23636,23926,24227,24521,24819,25107,25414,25730,26120,26497,26895,27344,27877,28463,29426,31355];
      
      private static const table2:Array = [-11725,-9420,-7910,-6801,-5948,-5233,-4599,-4039,-3507,-3030,-2596,-2170,-1774,-1383,-1016,-660,-329,-1,337,696,1085,1512,1962,2433,2968,3569,4314,5279,6622,8154,10076,12975];
      
      private static const table3:Array = [0,-0.847256005,0.722470999,-1.52474797,-0.453148007,0.375360996,1.47178996,-1.98225796,-1.19293797,-0.582937002,-0.0693780035,0.390956998,0.906920016,1.486274,2.22154093,-2.38878703,-1.80675399,-1.41054201,-1.07736099,-0.799501002,-0.555810988,-0.333402008,-0.132449001,0.0568020009,0.254877001,0.477355003,0.738685012,1.04430604,1.39544594,1.80987501,2.39187598,-2.38938308,-1.98846805,-1.75140405,-1.56431198,-1.39221299,-1.216465,-1.04694998,-0.890510023,-0.764558017,-0.645457983,-0.52592802,-0.405954987,-0.302971989,-0.209690005,-0.123986997,-0.0479229987,0.025773,0.100134,0.173718005,0.258554012,0.352290004,0.456988007,0.576775014,0.700316012,0.842552006,1.00938797,1.18213499,1.35345602,1.53208196,1.73326194,1.97223496,2.39781404,-2.5756309,-2.05733204,-1.89849198,-1.77278101,-1.66626,-1.57421803,-1.49933195,-1.43166399,-1.36522806,-1.30009902,-1.22809303,-1.15885794,-1.09212506,-1.013574,-0.920284986,-0.828705013,-0.737488985,-0.644775987,-0.559094012,-0.485713989,-0.411031991,-0.345970005,-0.285115987,-0.234162003,-0.187058002,-0.144250005,-0.110716999,-0.0739680007,-0.0365610011,-0.00732900016,0.0203610007,0.0479039997,0.0751969963,0.0980999991,0.122038998,0.145899996,0.169434994,0.197045997,0.225243002,0.255686998,0.287010014,0.319709986,0.352582991,0.388906986,0.433492005,0.476945996,0.520482004,0.564453006,0.612204015,0.668592989,0.734165013,0.803215981,0.878404021,0.956620991,1.03970695,1.12937701,1.22111595,1.30802798,1.40248001,1.50568199,1.62277305,1.77249599,1.94308805,2.29039311,0];
      
      private static const table4:Array = [0.999981225,0.999529421,0.998475611,0.996820271,0.994564593,0.991709828,0.988257587,0.984210074,0.979569793,0.974339426,0.968522072,0.962121427,0.955141187,0.947585583,0.939459205,0.930767,0.921513975,0.911705971,0.901348829,0.890448689,0.879012227,0.867046177,0.854557991,0.841554999,0.828045011,0.81403631,0.799537301,0.784556627,0.769103289,0.753186822,0.736816585,0.720002472,0.702754676,0.685083687,0.666999876,0.64851439,0.629638195,0.610382795,0.590759695,0.570780694,0.550458014,0.529803574,0.50883007,0.487550199,0.465976506,0.444122106,0.422000289,0.399624199,0.377007395,0.354163498,0.331106305,0.307849586,0.284407496,0.260794103,0.237023607,0.213110298,0.189068705,0.164913103,0.1406582,0.116318598,0.0919089988,0.0674438998,0.0429382995,0.0184067003];
      
      private static const table5:Array = [0.125,0.124962397,0.124849401,0.124661297,0.124398097,0.124059901,0.123647101,0.123159699,0.122598201,0.121962801,0.1212539,0.120471999,0.119617499,0.118690997,0.117693,0.116624102,0.115484901,0.114276201,0.112998702,0.111653,0.110240199,0.108760901,0.107216097,0.105606697,0.103933699,0.102198102,0.100400902,0.0985433012,0.0966262966,0.094651103,0.0926188976,0.0905309021,0.0883883014,0.0861926004,0.0839449018,0.0816465989,0.0792991966,0.076903902,0.0744623989,0.0719759986,0.069446303,0.0668746978,0.0642627999,0.0616123006,0.0589246005,0.0562013984,0.0534444004,0.0506552011,0.0478353985,0.0449868999,0.0421111993,0.0392102003,0.0362856016,0.0333391018,0.0303725004,0.0273876991,0.0243862998,0.0213702004,0.0183412991,0.0153013002,0.0122520998,0.0091955997,0.00613350002,0.00306769996];
      
      private static const table6:Array = [-0.00613590004,-0.0306748003,-0.0551952012,-0.0796824023,-0.104121603,-0.128498107,-0.152797207,-0.177004203,-0.201104596,-0.225083902,-0.248927593,-0.272621393,-0.296150893,-0.319501996,-0.342660695,-0.365613014,-0.388345003,-0.410843194,-0.433093786,-0.455083609,-0.47679919,-0.498227686,-0.519356012,-0.540171504,-0.560661614,-0.580814004,-0.600616515,-0.620057225,-0.639124393,-0.657806695,-0.676092684,-0.693971515,-0.711432219,-0.728464425,-0.745057821,-0.761202395,-0.77688849,-0.792106628,-0.806847572,-0.8211025,-0.834862888,-0.848120272,-0.860866904,-0.873094976,-0.884797096,-0.895966172,-0.906595707,-0.916679084,-0.926210225,-0.935183525,-0.943593502,-0.95143503,-0.958703518,-0.965394378,-0.971503913,-0.977028072,-0.981963873,-0.986308098,-0.990058184,-0.993211925,-0.995767415,-0.997723103,-0.999077678,-0.999830604];
      
      private static const table7:Array = [0.00613590004,0.0184067003,0.0306748003,0.0429382995,0.0551952012,0.0674438998,0.0796824023,0.0919089988,0.104121603,0.116318598,0.128498107,0.1406582,0.152797207,0.164913103,0.177004203,0.189068705,0.201104596,0.213110298,0.225083902,0.237023607,0.248927593,0.260794103,0.272621393,0.284407496,0.296150893,0.307849586,0.319501996,0.331106305,0.342660695,0.354163498,0.365613014,0.377007395,0.388345003,0.399624199,0.410843194,0.422000289,0.433093786,0.444122106,0.455083609,0.465976506,0.47679919,0.487550199,0.498227686,0.50883007,0.519356012,0.529803574,0.540171504,0.550458014,0.560661614,0.570780694,0.580814004,0.590759695,0.600616515,0.610382795,0.620057225,0.629638195,0.639124393,0.64851439,0.657806695,0.666999876,0.676092684,0.685083687,0.693971515,0.702754676,0.711432219,0.720002472,0.728464425,0.736816585,0.745057821,0.753186822,0.761202395,0.769103289,0.77688849,0.784556627,0.792106628,0.799537301,0.806847572,0.81403631,0.8211025,0.828045011,0.834862888,0.841554999,0.848120272,0.854557991,0.860866904,0.867046177,0.873094976,0.879012227,0.884797096,0.890448689,0.895966172,0.901348829,0.906595707,0.911705971,0.916679084,0.921513975,0.926210225,0.930767,0.935183525,0.939459205,0.943593502,0.947585583,0.95143503,0.955141187,0.958703518,0.962121427,0.965394378,0.968522072,0.971503913,0.974339426,0.977028072,0.979569793,0.981963873,0.984210074,0.986308098,0.988257587,0.990058184,0.991709828,0.993211925,0.994564593,0.995767415,0.996820271,0.997723103,0.998475611,0.999077678,0.999529421,0.999830604,0.999981225];
      
      public static const table9:Array = [32767,30840,29127,27594,26214,24966,23831,22795,21845,20972,20165,19418,18725,18079,17476,16913,16384,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
      
      private static const table10:Array = [0,0.0122715384,0.024541229,0.0368072242,0.0490676723,0.061320737,0.0735645667,0.0857973099,0.0980171412,0.110222213,0.122410677,0.134580716,0.146730468,0.158858135,0.170961887,0.183039889,0.195090324,0.207111374,0.219101235,0.231058106,0.242980182,0.254865646,0.266712755,0.27851969,0.290284693,0.302005947,0.313681751,0.32531029,0.336889863,0.348418683,0.359895051,0.371317178,0.382683426,0.393992037,0.405241311,0.416429549,0.427555084,0.438616246,0.449611336,0.460538715,0.471396744,0.482183784,0.492898196,0.50353837,0.514102757,0.524589658,0.534997642,0.545324981,0.555570245,0.565731823,0.575808167,0.585797846,0.59569931,0.605511069,0.615231574,0.624859512,0.634393275,0.643831551,0.653172851,0.662415802,0.671558976,0.680601001,0.689540565,0.698376238,0.707106769,0.715730846,0.724247098,0.732654274,0.740951121,0.749136388,0.757208824,0.765167296,0.773010433,0.780737221,0.78834641,0.795836926,0.803207517,0.81045723,0.817584813,0.824589312,0.831469595,0.838224709,0.84485358,0.851355195,0.857728601,0.863972843,0.870086968,0.876070082,0.881921232,0.887639642,0.893224299,0.898674488,0.903989315,0.909168005,0.914209783,0.919113874,0.923879504,0.928506076,0.932992816,0.937339008,0.941544056,0.945607305,0.949528158,0.953306019,0.956940353,0.960430503,0.963776052,0.966976464,0.970031261,0.972939968,0.975702107,0.97831738,0.980785251,0.983105481,0.985277653,0.987301409,0.989176512,0.990902662,0.992479503,0.993906975,0.99518472,0.996312618,0.997290432,0.998118103,0.99879545,0.999322355,0.999698818,0.999924719,1];
      
      public function _14152()
      {
         super();
      }
      
      public static function decode(param1:Array, param2:ByteArray, param3:Array) : void
      {
         var _loc14_:Number = NaN;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:Number = NaN;
         var _loc19_:* = 0;
         var _loc20_:Number = NaN;
         var _loc4_:ByteArray = new ByteArray();
         var _loc5_:Array = new Array();
         var _loc6_:Array = new Array();
         var _loc7_:Array = new Array();
         var _loc8_:BitStream = new BitStream();
         var _loc9_:int = _loc8_.pop(gainBit[0],param2);
         _loc4_[0] = _loc9_;
         _loc5_[0] = table1[_loc9_];
         var _loc10_:int = 1;
         while(_loc10_ < 23)
         {
            _loc9_ = _loc8_.pop(gainBit[_loc10_],param2);
            _loc4_[_loc10_] = _loc9_;
            _loc5_[_loc10_] = _loc5_[_loc10_ - 1] + table2[_loc9_];
            _loc10_++;
         }
         _loc10_ = 0;
         while(_loc10_ < 23)
         {
            _loc14_ = Math.pow(2,_loc5_[_loc10_] * (0.5 * 0.0009765625));
            _loc15_ = int(bandBound[_loc10_]);
            _loc16_ = int(bandBound[_loc10_ + 1]);
            while(_loc15_ < _loc16_)
            {
               _loc7_[_loc15_] = _loc5_[_loc10_];
               _loc6_[_loc15_] = _loc14_;
               _loc15_++;
            }
            _loc10_++;
         }
         var _loc11_:Array = new Array();
         var _loc12_:int = _15132(_loc7_,124,198,_loc11_);
         var _loc13_:int = 0;
         while(_loc13_ < 256)
         {
            _loc10_ = 0;
            while(_loc10_ < 124)
            {
               _loc17_ = int(_loc11_[_loc10_]);
               _loc18_ = Number(_loc6_[_loc10_]);
               if(_loc17_ > 0)
               {
                  _loc19_ = 1 << _loc17_;
                  _loc9_ = _loc8_.pop(_loc17_,param2);
                  _loc4_[_loc10_] = _loc9_;
                  _loc18_ *= table3[_loc19_ - 1 + _loc9_];
               }
               else
               {
                  _loc20_ = Math.random() * 4294967296;
                  if(_loc20_ < (1 << 30) + (1 << 14))
                  {
                     _loc18_ *= -0.707099974;
                  }
                  else
                  {
                     _loc18_ *= 0.707099974;
                  }
               }
               _loc5_[_loc10_] = _loc18_;
               _loc10_++;
            }
            _loc10_ = 124;
            while(_loc10_ < 128)
            {
               _loc5_[_loc10_] = 0;
               _loc10_++;
            }
            _loc10_ = _loc12_;
            while(_loc10_ > 0)
            {
               if(_loc10_ <= 8)
               {
                  _loc8_.pop(_loc10_,param2);
                  break;
               }
               _loc8_.pop(8,param2);
               _loc10_ -= 8;
            }
            _15128(param1,_loc5_,7,param3,_loc13_);
            _loc13_ += 128;
         }
      }
      
      private static function _15132(param1:Array, param2:int, param3:int, param4:Array) : int
      {
         var _loc8_:NormalizedInt32 = null;
         var _loc16_:* = 0;
         var _loc17_:int = 0;
         var _loc18_:* = 0;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         var _loc25_:int = 0;
         var _loc26_:int = 0;
         var _loc27_:* = 0;
         var _loc28_:* = 0;
         var _loc29_:int = 0;
         var _loc5_:Number = 0;
         var _loc6_:int = 0;
         while(_loc6_ < param2)
         {
            if(param1[_loc6_] > _loc5_)
            {
               _loc5_ = Number(param1[_loc6_]);
            }
            _loc6_++;
         }
         var _loc7_:int = 0;
         _loc8_ = new NormalizedInt32(_loc5_);
         _loc7_ = _loc8_.scale - 16;
         var _loc9_:Array = new Array();
         if(_loc7_ < 0)
         {
            _loc6_ = 0;
            while(_loc6_ < param2)
            {
               _loc9_[_loc6_] = param1[_loc6_] >> -_loc7_;
               _loc6_++;
            }
         }
         else
         {
            _loc6_ = 0;
            while(_loc6_ < param2)
            {
               _loc9_[_loc6_] = param1[_loc6_] << _loc7_;
               _loc6_++;
            }
         }
         var _loc10_:Factor = new Factor(param2);
         _loc6_ = 0;
         while(_loc6_ < param2)
         {
            _loc9_[_loc6_] = int(_loc9_[_loc6_]) * 3 >> 2;
            _loc6_++;
         }
         var _loc11_:int = 0;
         _loc6_ = 0;
         while(_loc6_ < param2)
         {
            _loc11_ += _loc9_[_loc6_];
            _loc6_++;
         }
         _loc7_ += 11;
         _loc11_ -= param3 << _loc7_;
         var _loc12_:* = 0;
         var _loc13_:int = _loc11_ - (param3 << _loc7_);
         _loc8_ = new NormalizedInt32(_loc13_);
         _loc12_ = (_loc13_ >> 16) * _loc10_.value >> 15;
         var _loc14_:int = 31 - _loc10_.shift - _loc8_.scale;
         if(_loc14_ >= 0)
         {
            _loc12_ <<= _loc14_;
         }
         else
         {
            _loc12_ >>= -_loc14_;
         }
         var _loc15_:int = _15131(_loc9_,_loc7_,param2,6,_loc12_);
         if(_loc15_ != param3)
         {
            _loc16_ = _loc15_ - param3;
            _loc17_ = 0;
            if(_loc16_ <= 0)
            {
               while(_loc16_ >= -16384)
               {
                  _loc17_++;
                  _loc16_ <<= 1;
               }
            }
            else
            {
               while(_loc16_ < 16384)
               {
                  _loc17_++;
                  _loc16_ <<= 1;
               }
            }
            _loc18_ = _loc16_ * _loc10_.value >> 15;
            _loc17_ = _loc7_ - (_loc10_.shift + _loc17_ - 15);
            if(_loc17_ >= 0)
            {
               _loc18_ <<= _loc17_;
            }
            else
            {
               _loc18_ >>= -_loc17_;
            }
            _loc19_ = 1;
            do
            {
               _loc20_ = _loc15_;
               _loc21_ = _loc12_;
               _loc12_ += _loc18_;
               _loc15_ = _15131(_loc9_,_loc7_,param2,6,_loc12_);
               if(++_loc19_ > 19)
               {
                  break;
               }
            }
            while((_loc15_ - param3) * (_loc20_ - param3) > 0);
            
            if(_loc15_ != param3)
            {
               if(_loc15_ > param3)
               {
                  _loc22_ = _loc12_;
                  _loc12_ = _loc21_;
                  _loc23_ = _loc15_;
                  _loc24_ = _loc20_;
               }
               else
               {
                  _loc22_ = _loc21_;
                  _loc23_ = _loc20_;
                  _loc24_ = _loc15_;
               }
               while(_loc15_ != param3 && _loc19_ < 20)
               {
                  _loc27_ = _loc12_ + _loc22_ >> 1;
                  _loc15_ = _15131(_loc9_,_loc7_,param2,6,_loc27_);
                  _loc19_++;
                  if(_loc15_ > param3)
                  {
                     _loc22_ = _loc27_;
                     _loc23_ = _loc15_;
                  }
                  else
                  {
                     _loc12_ = _loc27_;
                     _loc24_ = _loc15_;
                  }
               }
               _loc25_ = Math.abs(int(_loc23_) - param3);
               _loc26_ = Math.abs(int(_loc24_) - param3);
               if(_loc25_ < _loc26_)
               {
                  _loc12_ = _loc22_;
                  _loc15_ = _loc23_;
               }
               else
               {
                  _loc15_ = _loc24_;
               }
            }
         }
         _loc6_ = 0;
         while(_loc6_ < param2)
         {
            _loc28_ = int(_loc9_[_loc6_]) - _loc12_;
            if(_loc28_ >= 0)
            {
               _loc28_ = _loc28_ + (1 << _loc7_ - 1) >> _loc7_;
            }
            else
            {
               _loc28_ = 0;
            }
            param4[_loc6_] = Math.min(_loc28_,6);
            _loc6_++;
         }
         if(_loc15_ > param3)
         {
            _loc6_ = 0;
            _loc29_ = 0;
            while(_loc29_ < param3)
            {
               _loc29_ += param4[_loc6_];
               _loc6_++;
            }
            _loc29_ -= param4[_loc6_ - 1];
            param4[_loc6_ - 1] = param3 - _loc29_;
            _loc15_ = param3;
            while(_loc6_ < param2)
            {
               param4[_loc6_] = 0;
               _loc6_++;
            }
         }
         return param3 - _loc15_;
      }
      
      private static function _15128(param1:Array, param2:Array, param3:int, param4:Array, param5:int) : void
      {
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc6_:* = 1 << param3;
         var _loc7_:* = _loc6_ >> 2;
         var _loc8_:int = _loc6_ - 1;
         var _loc9_:* = _loc6_ >> 1;
         var _loc10_:int = _loc9_ - 1;
         var _loc11_:int = 0;
         _15129(param2,0,param3,param4,param5);
         while(_loc11_ < _loc7_)
         {
            _loc12_ = Number(param1[_loc11_]);
            _loc13_ = Number(param1[_loc10_]);
            _loc14_ = Number(param4[param5 + _loc9_]);
            _loc15_ = Number(param4[param5 + _loc8_]);
            param1[_loc11_] = -param4[param5 + _loc10_];
            param1[_loc10_] = -param4[param5 + _loc11_];
            param4[param5 + _loc11_] = _loc12_ * table7[_loc8_] + _loc14_ * table7[_loc11_];
            param4[param5 + _loc10_] = _loc13_ * table7[_loc9_] + _loc15_ * table7[_loc10_];
            param4[param5 + _loc9_] = table7[_loc9_] * -_loc15_ + table7[_loc10_] * _loc13_;
            param4[param5 + _loc8_] = table7[_loc8_] * -_loc14_ + table7[_loc11_] * _loc12_;
            _loc11_++;
            _loc10_--;
            _loc9_++;
            _loc8_--;
         }
      }
      
      private static function _15129(param1:Array, param2:int, param3:int, param4:Array, param5:int) : void
      {
         var _loc14_:* = 0;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc23_:Number = NaN;
         var _loc24_:Number = NaN;
         var _loc6_:* = 1 << param3;
         var _loc7_:int = (_loc6_ >> 1) - 1;
         var _loc8_:* = _loc6_ >> 2;
         var _loc9_:int = 0;
         while(_loc9_ < _loc8_)
         {
            _loc14_ = _loc9_ << 1;
            _loc15_ = _loc6_ - 1 - _loc14_;
            _loc16_ = _loc15_ - 1;
            _loc17_ = Number(param1[param2 + _loc14_]);
            _loc18_ = Number(param1[param2 + _loc14_ + 1]);
            _loc19_ = Number(param1[param2 + _loc15_]);
            _loc20_ = Number(param1[param2 + _loc16_]);
            param4[param5 + _loc14_] = table4[_loc9_] * _loc17_ - table6[_loc9_] * _loc19_;
            param4[param5 + _loc14_ + 1] = _loc19_ * table4[_loc9_] + _loc17_ * table6[_loc9_];
            param4[param5 + _loc16_] = table4[_loc7_ - _loc9_] * _loc20_ - table6[_loc7_ - _loc9_] * _loc18_;
            param4[param5 + _loc15_] = _loc18_ * table4[_loc7_ - _loc9_] + _loc20_ * table6[_loc7_ - _loc9_];
            _loc9_++;
         }
         _15130(param4,param5,param3 - 1);
         var _loc10_:Number = Number(param4[param5 + _loc6_ - 1]);
         var _loc11_:Number = Number(param4[param5 + _loc6_ - 2]);
         param4[param5] = table5[0] * param4[param5];
         param4[param5 + _loc6_ - 1] = param4[param5 + 1] * -table5[0];
         param4[param5 + _loc6_ - 2] = table5[_loc7_] * param4[param5 + _loc6_ - 2] + table5[1] * _loc10_;
         param4[param5 + 1] = _loc11_ * table5[1] - _loc10_ * table5[_loc7_];
         var _loc12_:int = _loc6_ - 3;
         var _loc13_:int = _loc7_;
         _loc15_ = 3;
         _loc9_ = 1;
         while(_loc9_ < _loc8_)
         {
            _loc21_ = Number(param4[param5 + _loc12_]);
            _loc22_ = Number(param4[param5 + _loc12_ - 1]);
            _loc23_ = Number(param4[param5 + _loc15_]);
            _loc24_ = Number(param4[param5 + _loc15_ - 1]);
            param4[param5 + _loc15_ - 1] = table5[_loc13_] * _loc23_ + table5[_loc15_ - 1 >> 1] * _loc24_;
            param4[param5 + _loc15_] = _loc22_ * table5[_loc15_ + 1 >> 1] - _loc21_ * table5[_loc13_ - 1];
            param4[param5 + _loc12_] = _loc24_ * table5[_loc13_] - _loc23_ * table5[_loc15_ - 1 >> 1];
            param4[param5 + _loc12_ - 1] = table5[_loc15_ + 1 >> 1] * _loc21_ + table5[_loc13_ - 1] * _loc22_;
            _loc9_++;
            _loc13_--;
            _loc12_ -= 2;
            _loc15_ += 2;
         }
      }
      
      private static function _15130(param1:Array, param2:int, param3:int) : void
      {
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:int = 0;
         var _loc20_:* = 0;
         var _loc21_:* = 0;
         var _loc22_:int = 0;
         var _loc23_:Number = NaN;
         var _loc24_:Number = NaN;
         var _loc4_:* = 1 << param3;
         _15125(param1,param2,_loc4_);
         var _loc5_:int = 0;
         var _loc6_:* = _loc4_ >> 1;
         while(_loc6_ > 0)
         {
            _loc11_ = Number(param1[param2 + _loc5_]);
            _loc12_ = Number(param1[param2 + _loc5_ + 1]);
            _loc13_ = Number(param1[param2 + _loc5_ + 2]);
            _loc14_ = Number(param1[param2 + _loc5_ + 3]);
            param1[param2 + _loc5_] = _loc11_ + _loc13_;
            param1[param2 + _loc5_ + 1] = _loc12_ + _loc14_;
            param1[param2 + _loc5_ + 2] = _loc11_ - _loc13_;
            param1[param2 + _loc5_ + 3] = _loc12_ - _loc14_;
            _loc6_--;
            _loc5_ += 4;
         }
         _loc5_ = 0;
         _loc6_ = _loc4_ >> 2;
         while(_loc6_ > 0)
         {
            _loc11_ = Number(param1[param2 + _loc5_]);
            _loc12_ = Number(param1[param2 + _loc5_ + 1]);
            _loc13_ = Number(param1[param2 + _loc5_ + 2]);
            _loc14_ = Number(param1[param2 + _loc5_ + 3]);
            _loc15_ = Number(param1[param2 + _loc5_ + 4]);
            _loc16_ = Number(param1[param2 + _loc5_ + 5]);
            _loc17_ = Number(param1[param2 + _loc5_ + 6]);
            _loc18_ = Number(param1[param2 + _loc5_ + 7]);
            param1[param2 + _loc5_] = _loc11_ + _loc15_;
            param1[param2 + _loc5_ + 1] = _loc12_ + _loc16_;
            param1[param2 + _loc5_ + 2] = _loc13_ + _loc18_;
            param1[param2 + _loc5_ + 3] = _loc14_ - _loc17_;
            param1[param2 + _loc5_ + 4] = _loc11_ - _loc15_;
            param1[param2 + _loc5_ + 5] = _loc12_ - _loc16_;
            param1[param2 + _loc5_ + 6] = _loc13_ - _loc18_;
            param1[param2 + _loc5_ + 7] = _loc14_ + _loc17_;
            _loc6_--;
            _loc5_ += 8;
         }
         _loc6_ = 0;
         var _loc7_:* = _loc4_ >> 3;
         var _loc8_:* = 64;
         var _loc9_:* = 4;
         var _loc10_:int = param3 - 2;
         while(_loc10_ > 0)
         {
            _loc5_ = 0;
            _loc19_ = _loc7_;
            while(_loc19_ != 0)
            {
               _loc20_ = _loc9_ >> 1;
               while(_loc20_ > 0)
               {
                  _loc22_ = _loc5_ + (_loc9_ << 1);
                  _loc11_ = Number(param1[param2 + _loc5_]);
                  _loc12_ = Number(param1[param2 + _loc5_ + 1]);
                  _loc23_ = Number(param1[param2 + _loc22_]);
                  _loc24_ = Number(param1[param2 + _loc22_ + 1]);
                  param1[param2 + _loc22_] = _loc11_ - (_loc23_ * table10[128 - _loc6_] + _loc24_ * table10[_loc6_]);
                  param1[param2 + _loc5_] = _loc11_ + (_loc23_ * table10[128 - _loc6_] + _loc24_ * table10[_loc6_]);
                  param1[param2 + _loc22_ + 1] = _loc12_ + (_loc23_ * table10[_loc6_] - _loc24_ * table10[128 - _loc6_]);
                  param1[param2 + _loc5_ + 1] = _loc12_ - (_loc23_ * table10[_loc6_] - _loc24_ * table10[128 - _loc6_]);
                  _loc20_--;
                  _loc5_ += 2;
                  _loc6_ += _loc8_;
               }
               _loc21_ = _loc9_ >> 1;
               while(_loc21_ > 0)
               {
                  _loc22_ = _loc5_ + (_loc9_ << 1);
                  _loc11_ = Number(param1[param2 + _loc5_]);
                  _loc12_ = Number(param1[param2 + _loc5_ + 1]);
                  _loc23_ = Number(param1[param2 + _loc22_]);
                  _loc24_ = Number(param1[param2 + _loc22_ + 1]);
                  param1[param2 + _loc22_] = _loc11_ + (_loc23_ * table10[128 - _loc6_] - _loc24_ * table10[_loc6_]);
                  param1[param2 + _loc5_] = _loc11_ - (_loc23_ * table10[128 - _loc6_] - _loc24_ * table10[_loc6_]);
                  param1[param2 + _loc22_ + 1] = _loc12_ + (_loc24_ * table10[128 - _loc6_] + _loc23_ * table10[_loc6_]);
                  param1[param2 + _loc5_ + 1] = _loc12_ - (_loc24_ * table10[128 - _loc6_] + _loc23_ * table10[_loc6_]);
                  _loc21_--;
                  _loc5_ += 2;
                  _loc6_ -= _loc8_;
               }
               _loc19_--;
               _loc5_ += _loc9_ << 1;
            }
            _loc10_--;
            _loc9_ <<= 1;
            _loc8_ >>= 1;
            _loc7_ >>= 1;
         }
      }
      
      private static function _15125(param1:Array, param2:int, param3:int) : void
      {
         var _loc7_:* = 0;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc4_:* = param3 << 1;
         var _loc5_:int = 1;
         var _loc6_:int = 1;
         while(_loc6_ < _loc4_)
         {
            if(_loc6_ < _loc5_)
            {
               _loc8_ = Number(param1[param2 + _loc6_]);
               param1[param2 + _loc6_] = param1[param2 + _loc5_];
               param1[param2 + _loc5_] = _loc8_;
               _loc9_ = Number(param1[param2 + _loc6_ - 1]);
               param1[param2 + _loc6_ - 1] = param1[param2 + _loc5_ - 1];
               param1[param2 + _loc5_ - 1] = _loc9_;
            }
            _loc7_ = param3;
            while(_loc7_ > 1 && _loc7_ < _loc5_)
            {
               _loc5_ -= _loc7_;
               _loc7_ >>= 1;
            }
            _loc5_ += _loc7_;
            _loc6_ += 2;
         }
      }
      
      private static function _15131(param1:Array, param2:int, param3:int, param4:int, param5:int) : int
      {
         var _loc9_:* = 0;
         var _loc6_:int = 0;
         if(param3 <= 0)
         {
            return _loc6_;
         }
         var _loc7_:* = 1 << param2 - 1;
         var _loc8_:int = 0;
         while(_loc8_ < param3)
         {
            _loc9_ = int(param1[_loc8_]) - param5;
            if(_loc9_ < 0)
            {
               _loc9_ = 0;
            }
            else
            {
               _loc9_ = _loc9_ + _loc7_ >> param2;
            }
            _loc6_ += Math.min(_loc9_,param4);
            _loc8_++;
         }
         return _loc6_;
      }
   }
}

import flash.utils.ByteArray;

class BitStream
{
   private var byteOffset:int = 0;
   
   private var bitOffset:int = 0;
   
   public function BitStream()
   {
      super();
   }
   
   public function push(param1:int, param2:int, param3:ByteArray) : void
   {
      if(this.bitOffset == 0)
      {
         param3[this.byteOffset] = param1;
      }
      else
      {
         param3[this.byteOffset] |= param1 << this.bitOffset;
      }
      this.bitOffset += param2;
      if(this.bitOffset >= 8)
      {
         ++this.byteOffset;
         this.bitOffset -= 8;
         if(this.bitOffset > 0)
         {
            param3[this.byteOffset] = param1 >> param2 - this.bitOffset;
         }
      }
   }
   
   public function pop(param1:int, param2:ByteArray) : int
   {
      var _loc3_:* = (int(param2[this.byteOffset]) & 0xFF) >> this.bitOffset;
      var _loc4_:int = 8 - this.bitOffset;
      if(param1 >= _loc4_)
      {
         ++this.byteOffset;
         if(param1 > _loc4_)
         {
            _loc3_ |= param2[this.byteOffset] << _loc4_;
         }
      }
      this.bitOffset = this.bitOffset + param1 & 7;
      return _loc3_ & (1 << param1) - 1;
   }
}

class NormalizedInt32
{
   public var value:int;
   
   public var scale:int;
   
   public function NormalizedInt32(param1:int)
   {
      var _loc4_:* = 0;
      super();
      if(param1 == 0)
      {
         this.value = param1;
         this.scale = 31;
         return;
      }
      if(param1 >= 1 << 30)
      {
         this.value = 0;
         this.scale = 0;
         return;
      }
      var _loc2_:* = param1;
      var _loc3_:int = 0;
      if(_loc2_ > 0)
      {
         do
         {
            _loc2_ <<= 1;
            _loc3_++;
         }
         while(_loc2_ < 1 << 30);
         
      }
      else
      {
         _loc4_ = 1 << 31;
         do
         {
            _loc2_ <<= 1;
            _loc3_++;
         }
         while(_loc2_ > _loc4_ + (1 << 30));
         
      }
      this.value = _loc2_;
      this.scale = _loc3_;
   }
}

import _14151._14152;

class Factor
{
   public var value:int;
   
   public var shift:int;
   
   public function Factor(param1:int)
   {
      super();
      if(param1 == 124)
      {
         this.value = 4228;
         this.shift = 19;
         return;
      }
      if(param1 == 0)
      {
         this.value = 0;
         this.shift = 0;
         return;
      }
      var _loc2_:int = (~param1 >>> 31 << 1) - 1;
      var _loc3_:* = param1 * _loc2_;
      var _loc4_:int = -1;
      while((_loc3_ & 1 << 15) == 0)
      {
         _loc3_ <<= 1;
         _loc4_++;
      }
      _loc3_ >>= 1;
      this.shift = 27 - _loc4_;
      var _loc5_:int = int(_14152.table9[_loc3_ - 15872 >> 10]);
      var _loc6_:* = _loc3_ * _loc5_;
      _loc6_ = (1 << 30) - _loc6_;
      var _loc7_:int;
      _loc6_ = (_loc7_ = (_loc6_ = (_loc6_ = (_loc6_ = (_loc6_ = _loc6_ + (1 << 14)) >> 15) * _loc5_) + (1 << 14)) >> 15) * _loc3_;
      _loc6_ = (1 << 29) - _loc6_;
      if((_loc6_ = (_loc6_ = (_loc6_ = (_loc6_ = (_loc6_ = (_loc6_ = _loc6_ + (1 << 14)) >> 15) * _loc7_) + (1 << 13)) >> 14) * _loc2_) > 32767 && _loc2_ == 1)
      {
         _loc6_ = 32767;
      }
      else if(_loc6_ < -32768 && _loc2_ == -1)
      {
         _loc6_ = -32768;
      }
      this.value = _loc6_;
   }
}

