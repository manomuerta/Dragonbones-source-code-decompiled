package _35
{
   import _11220._11219;
   import _11489.Curve;
   import _13492._13491;
   import _13492._13493;
   import _13492._13494;
   import _13492._13495;
   import _13492._13496;
   import _13492._13497;
   import _13492._13498;
   import _13492._13499;
   import _13492._13500;
   import _13492._13501;
   import _13492._14034;
   import _13503._13502;
   import _13505._13504;
   import _13505._13506;
   import _13505._13507;
   import _13505._13508;
   import _13505._13509;
   import _13505._13510;
   import _13505._14035;
   import _176._175;
   import _40._44;
   import _51._50;
   import _51._52;
   import _51._69;
   import _51._70;
   import _51._71;
   import _51._77;
   import _51._78;
   import _51._79;
   import _658.Mesh;
   import _658._661;
   import _721._763;
   import _73.BoundingBoxType;
   import _73.SymbolType;
   import _73._74;
   import _73._75;
   import _81._86;
   import _97._100;
   import _97._101;
   import _97._10600;
   import _97._124;
   import _97._98;
   import _978.Timeline;
   import egret.utils.FileUtil;
   import egret.utils.tr;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   
   public class _13487
   {
      private static var _1786:String;
      
      private static var _1731:String;
      
      private static var _1820:Object;
      
      private static var _type:int;
      
      private static var _1802:Vector.<_52>;
      
      public static const DEFALUT_ARMATURE_NAME:String = "armature";
      
      public static const DATA_TYPE_TEXTURE:int = 0;
      
      public static const DATA_TYPE_FILES:int = 1;
      
      public static const DATA_TYPE_SWF:int = 2;
      
      private static var _11280:_50 = null;
      
      public function _13487()
      {
         super();
      }
      
      public static function _1777(param1:Object, param2:Object, param3:ByteArray) : ByteArray
      {
         var _loc4_:ByteArray = new ByteArray();
         _loc4_.writeBytes(param3);
         var _loc5_:ByteArray = new ByteArray();
         _loc5_.writeObject(param2);
         _loc5_.compress();
         _loc4_.position = _loc4_.length;
         _loc4_.writeBytes(_loc5_);
         _loc4_.writeInt(_loc5_.length);
         _loc5_.length = 0;
         _loc5_.writeObject(param1);
         _loc5_.compress();
         _loc4_.position = _loc4_.length;
         _loc4_.writeBytes(_loc5_);
         _loc4_.writeInt(_loc5_.length);
         return _loc4_;
      }
      
      public static function _1768(param1:ByteArray) : _36
      {
         var _1756:Object = null;
         var _1748:Object = null;
         var decompressedData:_36 = null;
         var bytesCopy:ByteArray = null;
         var strSize:int = 0;
         var position:uint = 0;
         var dataBytes:ByteArray = null;
         var bytes:ByteArray = param1;
         var dataType:String = _98.getType(bytes);
         switch(dataType)
         {
            case _98.SWF:
            case _98.PNG:
            case _98.JPG:
            case _98.ATF:
               try
               {
                  bytesCopy = new ByteArray();
                  bytesCopy.writeBytes(bytes);
                  bytes = bytesCopy;
                  bytes.position = bytes.length - 4;
                  strSize = bytes.readInt();
                  position = uint(bytes.length - 4 - strSize);
                  dataBytes = new ByteArray();
                  dataBytes.writeBytes(bytes,position,strSize);
                  dataBytes.uncompress();
                  bytes.length = position;
                  _1756 = dataBytes.readObject();
                  bytes.position = bytes.length - 4;
                  strSize = bytes.readInt();
                  position = uint(bytes.length - 4 - strSize);
                  dataBytes.length = 0;
                  dataBytes.writeBytes(bytes,position,strSize);
                  dataBytes.uncompress();
                  bytes.length = position;
                  _1748 = dataBytes.readObject();
               }
               catch(e:Error)
               {
                  throw new Error(tr("Import.error.png"));
               }
               decompressedData = new _36(_1756,_1748,bytes);
               decompressedData._1723 = dataType;
               return decompressedData;
            case _98.ZIP:
               throw new Error(tr("Import.error.zip"));
            default:
               throw new Error(tr("Import.error.nosupport"));
         }
      }
      
      public static function _1720(param1:*, param2:Number = 1) : Object
      {
         var _loc3_:Object = {};
         if(param1 is XML)
         {
            _loc3_ = _1714(param1,param2);
         }
         else
         {
            _loc3_ = _1713(param1,param2);
         }
         return _loc3_;
      }
      
      private static function _1714(param1:XML, param2:Number = 1) : Object
      {
         var _loc4_:Rectangle = null;
         var _loc5_:XML = null;
         var _loc6_:String = null;
         var _loc7_:Rectangle = null;
         var _loc8_:* = false;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc3_:Object = {};
         _loc3_.__name = param1[_101.A_NAME];
         for each(_loc5_ in param1[_101.SUB_TEXTURE])
         {
            _loc6_ = _loc5_[_101.A_NAME];
            (_loc7_ = new Rectangle()).x = int(_loc5_[_101.A_X]) / param2;
            _loc7_.y = int(_loc5_[_101.A_Y]) / param2;
            _loc7_.width = int(_loc5_[_101.A_WIDTH]) / param2;
            _loc7_.height = int(_loc5_[_101.A_HEIGHT]) / param2;
            _loc8_ = _loc5_[_101.A_ROTATED] == "true";
            _loc9_ = int(_loc5_[_101.A_FRAME_WIDTH]) / param2;
            _loc10_ = int(_loc5_[_101.A_FRAME_HEIGHT]) / param2;
            if(_loc9_ > 0 && _loc10_ > 0)
            {
               (_loc4_ = new Rectangle()).x = int(_loc5_[_101.A_FRAME_X]) / param2;
               _loc4_.y = int(_loc5_[_101.A_FRAME_Y]) / param2;
               _loc4_.width = _loc9_;
               _loc4_.height = _loc10_;
            }
            else
            {
               _loc4_ = null;
            }
            _loc3_[_loc6_] = new _38(_loc7_,_loc4_,_loc8_);
         }
         return _loc3_;
      }
      
      private static function _1713(param1:Object, param2:Number = 1) : Object
      {
         var _loc4_:Rectangle = null;
         var _loc5_:Object = null;
         var _loc6_:String = null;
         var _loc7_:Rectangle = null;
         var _loc8_:* = false;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc3_:Object = {};
         _loc3_.__name = param1[_101.A_NAME];
         for each(_loc5_ in param1[_101.SUB_TEXTURE])
         {
            _loc6_ = _loc5_[_101.A_NAME];
            (_loc7_ = new Rectangle()).x = int(_loc5_[_101.A_X]) / param2;
            _loc7_.y = int(_loc5_[_101.A_Y]) / param2;
            _loc7_.width = int(_loc5_[_101.A_WIDTH]) / param2;
            _loc7_.height = int(_loc5_[_101.A_HEIGHT]) / param2;
            _loc8_ = _loc5_[_101.A_ROTATED] == "true";
            _loc9_ = int(_loc5_[_101.A_FRAME_WIDTH]) / param2;
            _loc10_ = int(_loc5_[_101.A_FRAME_HEIGHT]) / param2;
            if(_loc9_ > 0 && _loc10_ > 0)
            {
               (_loc4_ = new Rectangle()).x = int(_loc5_[_101.A_FRAME_X]) / param2;
               _loc4_.y = int(_loc5_[_101.A_FRAME_Y]) / param2;
               _loc4_.width = _loc9_;
               _loc4_.height = _loc10_;
            }
            else
            {
               _loc4_ = null;
            }
            _loc3_[_loc6_] = new _38(_loc7_,_loc4_,_loc8_);
         }
         return _loc3_;
      }
      
      public static function _1769(param1:*, param2:_37, param3:String, param4:Boolean = true) : _71
      {
         _1786 = param3;
         _type = DATA_TYPE_SWF;
         var _loc5_:Object = _175._1771(param1,param2,null);
         var _loc6_:Boolean = false;
         if(param4)
         {
            _loc6_ = _1798(param1,_101.A_EXTRA,false);
         }
         return parser(_loc5_,_loc6_);
      }
      
      public static function _1737(param1:*, param2:_37, param3:String = null, param4:String = null, param5:Boolean = true) : _71
      {
         _1786 = param3;
         _1731 = param4;
         _type = DATA_TYPE_TEXTURE;
         var _loc6_:Object = _175._1771(param1,param2,null);
         var _loc7_:Boolean = false;
         if(param5)
         {
            _loc7_ = _1798(param1,_101.A_EXTRA,false);
         }
         return parser(_loc6_,_loc7_);
      }
      
      public static function _1757(param1:*, param2:Object, param3:Boolean = true, param4:Boolean = false) : _71
      {
         _type = DATA_TYPE_FILES;
         _1820 = param2;
         var _loc5_:Object = _175._1771(param1,null,param2);
         var _loc6_:Boolean = false;
         if(param3)
         {
            _loc6_ = _1798(param1,_101.A_EXTRA,false);
         }
         return parser(_loc5_,_loc6_,param4);
      }
      
      public static function parser(param1:Object, param2:Boolean = true, param3:Boolean = false) : _71
      {
         var _loc10_:Object = null;
         var _loc11_:_71 = null;
         var _loc4_:String = param1[_101.A_VERSION];
         if(_loc4_ != "5.5")
         {
            _13490._13602(param1);
         }
         var _loc5_:uint = uint(int(param1[_101.A_FRAME_RATE]));
         if(_loc5_ <= 0)
         {
            _loc5_ = Timeline.DEFAULT_FPS;
         }
         var _loc6_:String = param1[_101.A_NAME];
         var _loc7_:Boolean = _1798(param1,_101.BASIC_ANIMATION,false);
         var _loc8_:String = _101.DATA_VERSION;
         var _loc9_:Vector.<_50> = new Vector.<_50>();
         for each(_loc10_ in param1[_101.ARMATURE])
         {
            if(_loc7_)
            {
               _loc10_[_101.A_TYPE] = SymbolType.MC;
            }
            _loc9_.push(_1736(_loc10_,_loc5_,param2,param3));
         }
         return _71._1572(_loc6_,_loc8_,_loc5_,_loc9_);
      }
      
      public static function _1736(param1:Object, param2:uint, param3:Boolean, param4:Boolean = false) : _50
      {
         var _loc7_:SymbolType = null;
         var _loc9_:_52 = null;
         var _loc11_:Object = null;
         var _loc12_:Object = null;
         var _loc13_:Object = null;
         var _loc14_:_78 = null;
         var _loc15_:_52 = null;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc19_:Object = null;
         var _loc20_:String = null;
         var _loc21_:Array = null;
         var _loc22_:_52 = null;
         var _loc23_:_79 = null;
         var _loc24_:int = 0;
         var _loc25_:int = 0;
         var _loc26_:Boolean = false;
         var _loc27_:Object = null;
         var _loc28_:_13502 = null;
         var _loc5_:uint = 0;
         if(param3)
         {
            if(!param4)
            {
               _loc5_ = uint(param1[_101.A_ID]);
            }
         }
         var _loc6_:String = !!param1[_101.A_NAME] ? param1[_101.A_NAME] : DEFALUT_ARMATURE_NAME;
         if(SymbolType.ARMATURE)
         {
            if(_101.A_TYPE in param1)
            {
               _loc20_ = String(param1[_101.A_TYPE]).toLowerCase();
               switch(_loc20_)
               {
                  case "armature":
                     _loc7_ = SymbolType.ARMATURE;
                     break;
                  case "movieclip":
                     _loc7_ = SymbolType.MC;
                     break;
                  case "stage":
                     _loc7_ = SymbolType.STAGE;
                     break;
                  case "sheet":
                     _loc7_ = SymbolType.SHEET;
                     break;
                  case "comic":
                     _loc7_ = SymbolType.COMIC;
                     return _34._1736(param1,param2,param3,param4);
                  default:
                     _loc7_ = SymbolType.ARMATURE;
               }
            }
            else
            {
               _loc7_ = SymbolType.ARMATURE;
            }
         }
         var _loc8_:_50 = _50._1782(_loc6_,_loc7_,_loc5_);
         _11280 = _loc8_;
         if(_loc7_ == SymbolType.SHEET && param3)
         {
            _11280.playTimes = _1815(param1,_101.A_PLAY_TIMES,0);
         }
         if(param1[_101.A_DEFAULT_ANIMATION])
         {
            _loc8_.defaultAnimation = param1[_101.A_DEFAULT_ANIMATION];
         }
         else
         {
            _loc21_ = param1[_101.A_DEFAULT_ACTIONS];
            if((Boolean(_loc21_)) && _loc21_.length == 1)
            {
               _loc8_.defaultAnimation = _loc21_[0][_101.A_GOTOANDPLAY];
            }
         }
         _loc8_.frameRate = _1815(param1,_101.A_FRAME_RATE,param2);
         if(isNaN(_loc8_.frameRate) || _loc8_.frameRate <= 0)
         {
            _loc8_.frameRate = param2;
         }
         param2 = _loc8_.frameRate;
         if(!param1[_101.A_NAME])
         {
            _loc9_ = _52._1729("root",null);
            _loc8_._1794(_loc9_);
            return _loc8_;
         }
         _loc8_.name = param1[_101.A_NAME];
         _1802 = new Vector.<_52>();
         var _loc10_:Object = {};
         for each(_loc11_ in param1[_101.BONE])
         {
            _loc22_ = _1772(_loc11_,param3,param4);
            if(_loc10_[_loc22_.name] == null)
            {
               _loc10_[_loc22_.name] = _loc22_;
               _1802.push(_loc22_);
               _loc8_._1794(_loc22_);
            }
            else
            {
               _loc22_.name = "$%error_" + _loc22_.name;
               _loc10_[_loc22_.name] = _loc22_;
               _1802.push(_loc22_);
               _loc8_._1794(_loc22_);
            }
         }
         _loc10_ = null;
         for each(_loc12_ in param1[_101.SLOT])
         {
            _loc23_ = _1774(_loc12_,_loc8_._1779,param3,param4);
            if(_loc23_.parentBoneData)
            {
               _loc8_._1792(_loc23_);
            }
         }
         for each(_loc13_ in param1[_101.SKIN])
         {
            _1721(_loc8_._1780,_loc13_,param3);
            _loc8_._1790(_1773(_loc13_,_loc8_._1780,param3,param4));
         }
         if(_loc8_._1781.length == 1)
         {
            (_loc8_._1781[0] as _78).name = "";
         }
         for each(_loc12_ in param1[_101.SLOT])
         {
            _1722(_loc12_,_loc8_._1780);
         }
         _loc16_ = 0;
         _loc17_ = int(_loc8_._1781.length);
         while(_loc16_ < _loc17_)
         {
            _loc14_ = _loc8_._1781[_loc16_];
            if(_loc14_.name == "")
            {
               _loc8_._1781.splice(_loc16_,1);
               break;
            }
            _loc16_++;
         }
         if(Boolean(_loc14_) && _loc14_.name == "")
         {
            _loc8_._1795 = _loc14_;
            _loc8_._1755 = _loc14_;
         }
         _loc16_ = 0;
         _loc17_ = int(_loc8_._1779.length);
         while(_loc16_ < _loc17_)
         {
            _loc15_ = _loc8_._1779[_loc16_] as _52;
            _loc24_ = 0;
            _loc25_ = int(_loc8_._1779.length);
            while(_loc24_ < _loc25_)
            {
               if(_loc15_._1764 == _loc8_._1779[_loc24_].name)
               {
                  _loc15_.parentBoneData = _loc8_._1779[_loc24_] as _52;
               }
               _loc24_++;
            }
            _loc16_++;
         }
         var _loc18_:int = 0;
         _loc16_ = 0;
         _loc17_ = int(_loc8_._1779.length);
         while(_loc16_ < _loc17_)
         {
            _loc15_ = _loc8_._1779[_loc16_] as _52;
            if(_loc15_.parentBoneData == null)
            {
               _loc18_++;
            }
            _loc16_++;
         }
         if(_loc18_ > 1)
         {
            _loc9_ = _52._1729("root",null);
            _loc16_ = 0;
            _loc17_ = int(_loc8_._1779.length);
            while(_loc16_ < _loc17_)
            {
               _loc15_ = _loc8_._1779[_loc16_] as _52;
               if(_loc15_.name == _loc9_.name)
               {
                  _loc26_ = true;
               }
               if(_loc15_.parentBoneData == null)
               {
                  _loc15_.parentBoneData = _loc9_;
               }
               _loc16_++;
            }
            if(_loc26_)
            {
               _loc9_.name = _124._1747(_loc9_.name,_loc8_._1793);
            }
            _loc8_._1794(_loc9_);
         }
         if(_loc8_._1779.length <= 0)
         {
            _loc9_ = _52._1729("root",null);
            _loc8_._1794(_loc9_);
         }
         _11279(_loc8_);
         _loc8_._1741();
         for each(_loc19_ in param1[_101.IK])
         {
            _loc8_._1822(_1788(_loc8_,_loc19_,param3,param4));
         }
         if(_loc8_._1811 != SymbolType.COMIC)
         {
            for each(_loc27_ in param1[_101.ANIMATION])
            {
               _loc28_ = _1730(_loc27_,param2,_loc8_,_loc8_._1779,_loc8_._1780,param3,param4);
               _loc8_._13580(_loc28_);
            }
            _loc8_._1751();
            _loc8_._1789();
            if(_loc8_._1781.length > 0)
            {
               _loc8_._1755 = _loc8_._1781[0];
            }
         }
         _loc8_._10654();
         _loc8_._10659 = _loc8_._10658;
         if(param3)
         {
            _11274(_loc8_);
         }
         if(_loc8_._1811 != SymbolType.STAGE)
         {
            if(param1[_101.CANVAS] != null)
            {
               _loc8_._2000 = _13226(param1[_101.CANVAS],param3);
            }
         }
         _loc8_._1871();
         return _loc8_;
      }
      
      private static function _13226(param1:Object, param2:Boolean) : _763
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc3_:_763 = new _763();
         _loc3_.x = param1.x;
         _loc3_.y = param1.y;
         _loc3_.width = param1.width;
         _loc3_.height = param1.height;
         _loc3_.hasBackground = param1.hasBackground;
         _loc3_.opened = param1.opened;
         _loc3_.bgColor = param1.bgColor;
         _loc3_._13227 = param1._13227;
         _loc3_.type = _763.TYPE_NEW;
         if(!param2)
         {
            if(param1.color == null)
            {
               _loc3_.hasBackground = false;
               _loc3_.bgColor = 16777215;
               _loc3_.opened = true;
            }
            else
            {
               _loc3_.bgColor = param1.color;
               _loc3_.hasBackground = true;
               _loc3_.opened = true;
               _loc3_._13227 = true;
            }
         }
         if(isNaN(_loc3_.x))
         {
            _loc3_.x = 0;
         }
         if(isNaN(_loc3_.y))
         {
            _loc3_.y = 0;
         }
         if(isNaN(_loc3_.width))
         {
            _loc3_.width = 800;
         }
         if(isNaN(_loc3_.height))
         {
            _loc3_.height = 600;
         }
         return _loc3_;
      }
      
      private static function _11279(param1:_50) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_52 = null;
         var _loc5_:_52 = null;
         if(param1._1779 == null || param1._1779.length == 0)
         {
            return;
         }
         _loc2_ = 0;
         _loc3_ = int(param1._1779.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = param1._1779[_loc2_] as _52;
            if(_loc4_.parentBoneData == null && _loc4_.name == "root")
            {
               _loc5_ = _loc4_;
               break;
            }
            _loc2_++;
         }
         if(_loc5_)
         {
            _loc2_ = 0;
            _loc3_ = int(param1._1779.length);
            while(_loc2_ < _loc3_)
            {
               _loc4_ = param1._1779[_loc2_] as _52;
               if(_loc4_ != _loc5_)
               {
                  if(_loc4_.parentBoneData == null)
                  {
                     _loc4_.parentBoneData = _loc5_;
                  }
                  else if(_loc4_.parentBoneData == _loc4_)
                  {
                     _loc4_.parentBoneData = _loc5_;
                  }
               }
               _loc2_++;
            }
         }
      }
      
      private static function _11274(param1:_50) : void
      {
         var _loc2_:_79 = null;
         var _loc3_:_70 = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc4_:* = false;
         var _loc5_:int = 0;
         var _loc6_:int = int(param1._1780.length);
         while(_loc5_ < _loc6_)
         {
            _loc2_ = param1._1780[_loc5_] as _79;
            if(Boolean(_loc2_) && Boolean(_loc2_._1715))
            {
               _loc4_ = _loc2_._1715.length > 0;
               _loc7_ = 0;
               _loc8_ = int(_loc2_._1715.length);
               while(_loc7_ < _loc8_)
               {
                  _loc3_ = _loc2_._1765[_loc2_._1715[_loc7_]];
                  if(Boolean(_loc3_) && _loc3_.type != _74.BOUNDINGBOX)
                  {
                     _loc4_ = false;
                     break;
                  }
                  _loc7_++;
               }
               _loc2_.onlyBoundingBox = _loc4_;
            }
            _loc5_++;
         }
      }
      
      private static function _1772(param1:Object, param2:Boolean, param3:Boolean) : _52
      {
         var _loc4_:uint = 0;
         if(param2)
         {
            if(!param3)
            {
               _loc4_ = uint(param1[_101.A_ID]);
            }
         }
         var _loc5_:_52;
         (_loc5_ = new _52(_loc4_)).name = param1[_101.A_NAME];
         _loc5_._1764 = param1[_101.A_PARENT];
         _loc5_.length = _1815(param1,_101.A_LENGTH,0);
         if(isNaN(_loc5_.length))
         {
            _loc5_.length = 0;
         }
         _loc5_.inheritRotation = _1798(param1,_101.A_INHERIT_ROTATION,true);
         _loc5_.inheritScale = _1798(param1,_101.A_INHERIT_SCALE,true);
         _1767(param1[_101.TRANSFORM],_loc5_._1724,null,param2);
         _loc5_._1724._1738();
         if(param2)
         {
            if(param1[_101.A_BONE_SYMBOL_COLOR])
            {
               _loc5_._14270 = param1[_101.A_BONE_SYMBOL_COLOR];
            }
            else
            {
               _loc5_._14270 = _100._14268;
            }
         }
         return _loc5_;
      }
      
      private static function _1788(param1:_50, param2:Object, param3:Boolean, param4:Boolean) : _77
      {
         var _loc5_:uint = 0;
         if(param3)
         {
            if(!param4)
            {
               _loc5_ = uint(param2[_101.A_ID]);
            }
         }
         var _loc6_:_77;
         (_loc6_ = new _77(_loc5_)).name = param2[_101.A_NAME];
         _loc6_.target = param1._1810(param2[_101.A_IK_TARGET]);
         _loc6_.bones = new Vector.<_52>();
         var _loc7_:_52 = param1._1810(param2[_101.A_IK_BONE]);
         if(Boolean(param2.hasOwnProperty(_101.A_IK_CHAIN)) && param2[_101.A_IK_CHAIN] == 1)
         {
            _loc6_.bones.push(_loc7_.parentBoneData);
         }
         _loc6_.bones.push(_loc7_);
         if(Boolean(param2.hasOwnProperty(_101.A_IK_BENDPOSITIVE)) && (param2[_101.A_IK_BENDPOSITIVE] == "false" || param2[_101.A_IK_BENDPOSITIVE] == false))
         {
            _loc6_.bendDirection = -1;
         }
         else
         {
            _loc6_.bendDirection = 1;
         }
         if(param2.hasOwnProperty(_101.A_IK_WEIGHT))
         {
            _loc6_.weight = param2[_101.A_IK_WEIGHT];
         }
         else
         {
            _loc6_.weight = 1;
         }
         return _loc6_;
      }
      
      private static function _1721(param1:Array, param2:Object, param3:Boolean) : void
      {
         var _loc5_:_79 = null;
         var _loc6_:String = null;
         var _loc9_:Object = null;
         var _loc10_:Object = null;
         var _loc4_:Object = {};
         var _loc7_:int = 0;
         var _loc8_:int = int(param1.length);
         while(_loc7_ < _loc8_)
         {
            _loc5_ = param1[_loc7_];
            _loc4_[_loc5_.name] = _loc5_;
            _loc7_++;
         }
         for each(_loc9_ in param2[_101.SLOT])
         {
            _loc6_ = _loc9_[_101.A_NAME];
            _loc5_ = _loc4_[_loc6_];
            if((Boolean(_loc5_)) && _loc5_._1715.length <= 0)
            {
               _loc7_ = 0;
               for each(_loc10_ in _loc9_[_101.DISPLAY])
               {
                  _loc5_._1718(_69._1807(++_loc7_));
               }
            }
         }
      }
      
      private static function _1773(param1:Object, param2:Array, param3:Boolean, param4:Boolean) : _78
      {
         var _loc7_:Object = null;
         var _loc8_:_79 = null;
         var _loc5_:uint = 0;
         if(param3)
         {
            if(!param4)
            {
               _loc5_ = uint(param1[_101.A_ID]);
            }
         }
         var _loc6_:_78;
         (_loc6_ = new _78(_loc5_)).name = param1[_101.A_NAME];
         for each(_loc7_ in param1[_101.SLOT])
         {
            _loc8_ = _1725(_loc6_,_loc7_,param2,param3,param4);
         }
         return _loc6_;
      }
      
      private static function _1725(param1:_78, param2:Object, param3:Array, param4:Boolean, param5:Boolean) : _79
      {
         var _loc6_:_79 = null;
         var _loc9_:_70 = null;
         var _loc10_:Object = null;
         var _loc7_:String = param2[_101.A_NAME];
         var _loc8_:Array = [];
         var _loc11_:Dictionary = new Dictionary();
         var _loc12_:int = 0;
         var _loc13_:int = int(param3.length);
         while(_loc12_ < _loc13_)
         {
            if(param3[_loc12_].name == _loc7_)
            {
               _loc6_ = param3[_loc12_];
               break;
            }
            _loc12_++;
         }
         if(param2[_101.DISPLAY])
         {
            _loc12_ = 0;
            _loc13_ = int(param2[_101.DISPLAY].length);
            while(_loc12_ < _loc13_)
            {
               _loc10_ = param2[_101.DISPLAY][_loc12_];
               if((Boolean(_loc10_)) && _loc10_[_101.A_NAME] != null)
               {
                  (_loc9_ = _1740(_loc10_,param4,param5))._1733 = _loc6_._1715[_loc12_];
                  _loc9_._1760 = _loc6_;
                  param1._1766(_loc9_);
               }
               _loc12_++;
            }
         }
         return _loc6_;
      }
      
      private static function _1722(param1:Object, param2:Array) : void
      {
         var _loc3_:_79 = null;
         var _loc4_:String = param1[_101.A_NAME];
         var _loc5_:int = int(param1[_101.A_DISPLAY_INDEX]);
         var _loc6_:int = 0;
         var _loc7_:int = int(param2.length);
         while(_loc6_ < _loc7_)
         {
            _loc3_ = param2[_loc6_];
            if(_loc3_.name == _loc4_)
            {
               if(_loc5_ >= 0)
               {
                  _loc3_._1711 = _loc3_._1715[_loc5_];
               }
               break;
            }
            _loc6_++;
         }
      }
      
      private static function _1774(param1:Object, param2:Array, param3:Boolean, param4:Boolean) : _79
      {
         var _loc11_:Array = null;
         var _loc5_:uint = 0;
         if(param3)
         {
            if(!param4)
            {
               _loc5_ = uint(param1[_101.A_ID]);
            }
         }
         var _loc6_:_79;
         (_loc6_ = new _79(_loc5_)).name = param1[_101.A_NAME];
         var _loc7_:Object = param1[_101.COLOR];
         if(_loc7_)
         {
            _1727(_loc7_,_loc6_._2152,param3);
         }
         var _loc8_:String = param1[_101.A_PARENT];
         if(param1[_101.A_GOTOANDPLAY])
         {
            _loc6_.gotoAndPlay = param1[_101.A_GOTOANDPLAY];
         }
         else
         {
            _loc11_ = param1[_101.A_ACTIONS];
            if((Boolean(_loc11_)) && _loc11_.length == 1)
            {
               _loc6_.gotoAndPlay = _loc11_[0][_101.A_GOTOANDPLAY];
            }
         }
         if(param1[_101.A_BLENDMODE])
         {
            switch(param1[_101.A_BLENDMODE])
            {
               case BlendMode.NORMAL:
                  _loc6_.blendMode = BlendMode.NORMAL;
                  break;
               case BlendMode.ADD:
                  _loc6_.blendMode = BlendMode.ADD;
                  break;
               case BlendMode.ERASE:
                  _loc6_.blendMode = BlendMode.ERASE;
                  break;
               default:
                  _loc6_.blendMode = BlendMode.NORMAL;
            }
         }
         else
         {
            _loc6_.blendMode = BlendMode.NORMAL;
         }
         var _loc9_:int = 0;
         var _loc10_:int = int(param2.length);
         while(_loc9_ < _loc10_)
         {
            if(param2[_loc9_].name == _loc8_)
            {
               _loc6_.parentBoneData = param2[_loc9_] as _52;
               break;
            }
            _loc9_++;
         }
         if(_loc6_.parentBoneData == null)
         {
            _loc6_.parentBoneData = param2[0];
         }
         if(param3)
         {
            _loc6_.onlyBoundingBox = _1798(param1,_101.ONLY_BOUNDINGBOX,false);
         }
         return _loc6_;
      }
      
      private static function _1740(param1:Object, param2:Boolean, param3:Boolean) : _70
      {
         var _loc9_:_70 = null;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:String = null;
         var _loc13_:String = null;
         var _loc4_:uint = 0;
         if(param2)
         {
            if(!param3)
            {
               _loc4_ = _1815(param1,_101.A_ID,0);
            }
         }
         var _loc5_:String;
         var _loc6_:String = _loc5_ = param1[_101.A_NAME];
         var _loc7_:String = param1[_101.A_PATH];
         if(_loc7_ != null)
         {
            _loc5_ = _loc7_;
         }
         var _loc8_:String = param1[_101.A_TYPE];
         if(_loc8_ == _101.TYPE_MESH)
         {
            return _1762(param1,param2,param3);
         }
         if(_loc8_ == _101.TYPE_BOUNDINGBOX)
         {
            return _11275(param1,param2,param3);
         }
         if(param2)
         {
            if(_loc8_ == _101.TYPE_ARMATURE)
            {
               (_loc9_ = _70._1743(_loc5_,_loc4_)).filterType = new _74(param1[_101.A_FILTER_TYPE]);
            }
            else
            {
               _loc12_ = param1[_101.A_TEXTURE_NAME];
               _loc13_ = _loc12_ == null ? _loc5_ : _loc12_ + "@" + _loc5_;
               _loc9_ = _70._1734(_loc13_,_loc4_);
            }
            _loc10_ = _1815(param1,_101.A_WIDTH,0);
            _loc11_ = _1815(param1,_101.A_HEIGHT,0);
            if(_loc10_ > 0)
            {
               _loc9_._1813 = _loc10_;
            }
            if(_loc11_ > 0)
            {
               _loc9_._1806 = _loc11_;
            }
         }
         else if(_loc8_ == _101.TYPE_ARMATURE)
         {
            _loc9_ = _70._1743(_loc5_,_loc4_);
         }
         else if(_13488._3712)
         {
            if(_13488._3712[_loc5_])
            {
               _loc13_ = _13488._3712[_loc5_].path;
            }
            if(_loc13_ == null)
            {
               _loc13_ = _loc5_;
            }
            _loc9_ = _70._1734(_loc13_,_loc4_);
         }
         else if(_type == DATA_TYPE_TEXTURE && _1786 != null && _1731 != null)
         {
            _loc13_ = FileUtil.getFileName(_1786) + "@" + param1[_101.A_NAME];
            _loc9_ = _70._1734(_loc13_,_loc4_);
         }
         else if(_type == DATA_TYPE_FILES && _1820 != null)
         {
            if(param1[_101.A_PATH])
            {
               _loc13_ = param1[_101.A_PATH];
            }
            else
            {
               _loc13_ = param1[_101.A_NAME];
            }
            _loc9_ = _70._1734(_loc13_,_loc4_);
         }
         else if(_type == DATA_TYPE_SWF)
         {
            _loc13_ = FileUtil.getFileNameWithSuffix(_1786) + "@" + param1[_101.A_NAME];
            _loc9_ = _70._1734(_loc13_,_loc4_);
         }
         else
         {
            _loc13_ = param1[_101.A_NAME];
            _loc9_ = _70._1734(_loc13_,_loc4_);
         }
         if(_loc7_ != null)
         {
            _loc9_._13228 = _loc6_;
         }
         _1767(param1[_101.TRANSFORM],_loc9_.localTransform,new Point());
         _loc9_.localTransform._1738();
         return _loc9_;
      }
      
      private static function _1762(param1:Object, param2:Boolean, param3:Boolean) : _70
      {
         var _loc10_:_70 = null;
         var _loc11_:String = null;
         var _loc12_:String = null;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc4_:uint = 0;
         if(param2)
         {
            if(!param3)
            {
               _loc4_ = _1815(param1,_101.A_ID,0);
            }
         }
         var _loc5_:String;
         var _loc6_:String = _loc5_ = param1[_101.A_NAME];
         var _loc7_:String = param1[_101.A_TYPE];
         var _loc8_:String = param1[_101.A_PATH];
         if(_loc8_ != null)
         {
            _loc5_ = _loc8_;
         }
         var _loc9_:Mesh = _1805(param1);
         if(param2)
         {
            _loc11_ = param1[_101.A_TEXTURE_NAME];
            _loc12_ = _loc11_ == null ? _loc5_ : _loc11_ + "@" + _loc5_;
            _loc10_ = _70._1719(_loc9_,_loc12_,_loc4_);
            _loc13_ = _1815(param1,_101.A_WIDTH,0);
            _loc14_ = _1815(param1,_101.A_HEIGHT,0);
            if(_loc13_ > 0)
            {
               _loc10_._1813 = _loc13_;
            }
            if(_loc14_ > 0)
            {
               _loc10_._1806 = _loc14_;
            }
         }
         else if(_13488._3712)
         {
            if(_13488._3712[_loc5_])
            {
               _loc12_ = _13488._3712[_loc5_].path;
            }
            if(_loc12_ == null)
            {
               _loc12_ = _loc5_;
            }
            _loc10_ = _70._1719(_loc9_,_loc12_,_loc4_);
         }
         else if(_type == DATA_TYPE_TEXTURE && _1786 != null && _1731 != null)
         {
            _loc12_ = FileUtil.getFileName(_1786) + "@" + param1[_101.A_NAME];
            _loc10_ = _70._1719(_loc9_,_loc12_,_loc4_);
         }
         else if(_type == DATA_TYPE_FILES && _1820 != null)
         {
            if(param1[_101.A_PATH])
            {
               _loc12_ = param1[_101.A_PATH];
            }
            else
            {
               _loc12_ = param1[_101.A_NAME];
            }
            _loc10_ = _70._1719(_loc9_,_loc12_,_loc4_);
         }
         else if(_type == DATA_TYPE_SWF)
         {
            _loc12_ = FileUtil.getFileNameWithSuffix(_1786) + "@" + param1[_101.A_NAME];
            _loc10_ = _70._1719(_loc9_,_loc12_,_loc4_);
         }
         else
         {
            _loc12_ = param1[_101.A_NAME];
            _loc10_ = _70._1719(_loc9_,_loc12_,_loc4_);
         }
         if(_loc8_ != null)
         {
            _loc10_._13228 = _loc6_;
         }
         _1767(param1[_101.TRANSFORM],_loc10_.localTransform,new Point());
         _loc10_.localTransform._1738();
         return _loc10_;
      }
      
      private static function _1805(param1:Object) : Mesh
      {
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:_661 = null;
         var _loc18_:int = 0;
         var _loc20_:_661 = null;
         var _loc21_:_661 = null;
         var _loc2_:Array = param1[_101.A_UV];
         var _loc3_:Array = param1[_101.A_VERTICES];
         var _loc4_:Array = param1[_101.A_EDGES];
         var _loc5_:Array = param1[_101.A_USER_EDGES];
         var _loc6_:Number = _1815(param1,_101.A_WIDTH,100);
         var _loc7_:Number = _1815(param1,_101.A_HEIGHT,100);
         var _loc8_:Number = _loc6_ / 2;
         var _loc9_:Number = _loc7_ / 2;
         if(_loc2_ == null || _loc3_ == null || _loc4_ == null)
         {
            return new Mesh(new BitmapData(100,100));
         }
         var _loc10_:Object = {};
         var _loc11_:Vector.<_661> = new Vector.<_661>();
         var _loc12_:Vector.<_661> = new Vector.<_661>();
         var _loc13_:Vector.<_661> = new Vector.<_661>();
         var _loc14_:Vector.<_661> = new Vector.<_661>();
         var _loc19_:Object = {};
         var _loc22_:Mesh = new Mesh(null);
         if(param1[_101.A_WEIGHTS])
         {
            _1791(param1[_101.A_WEIGHTS]);
            _1785(_loc22_,param1[_101.A_WEIGHTS],param1[_101.A_SLOT_POSE],param1[_101.A_BONE_POSE]);
         }
         _loc15_ = 0;
         _loc16_ = int(_loc3_.length);
         while(_loc15_ < _loc16_)
         {
            _loc18_ = _loc15_ / 2;
            _loc17_ = _loc22_._1750(_loc3_[_loc15_],_loc3_[_loc15_ + 1]);
            _loc14_.push(_loc17_.clone() as _661);
            _loc17_.x = _loc2_[_loc15_] * _loc6_ - _loc8_;
            _loc17_.y = _loc2_[_loc15_ + 1] * _loc7_ - _loc9_;
            _loc11_.push(_loc17_);
            _loc19_[_loc18_] = _loc17_;
            _loc15_ += 2;
         }
         _loc15_ = 0;
         _loc16_ = int(_loc4_.length);
         while(_loc15_ < _loc16_)
         {
            _loc20_ = _loc19_[_loc4_[_loc15_]];
            _loc21_ = _loc19_[_loc4_[_loc15_ + 1]];
            if(!(Boolean(_loc20_) && Boolean(_loc21_)))
            {
               throw new Error("this mesh data is broken!");
            }
            _loc12_.push(_loc20_,_loc21_);
            _loc15_ += 2;
         }
         if(_loc5_)
         {
            _loc15_ = 0;
            _loc16_ = int(_loc5_.length);
            while(_loc15_ < _loc16_)
            {
               _loc20_ = _loc19_[_loc5_[_loc15_]];
               _loc21_ = _loc19_[_loc5_[_loc15_ + 1]];
               if(!(Boolean(_loc20_) && Boolean(_loc21_)))
               {
                  throw new Error("this mesh data is broken!");
               }
               _loc13_.push(_loc20_,_loc21_);
               _loc15_ += 2;
            }
         }
         _loc10_._1812 = _loc14_;
         _loc10_.vertices = _loc11_;
         _loc10_.outline = _loc12_;
         _loc10_.userEdges = _loc13_;
         _loc10_.width = _loc6_;
         _loc10_.height = _loc7_;
         _loc22_._1796(_loc10_);
         return _loc22_;
      }
      
      private static function _1791(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         _loc2_ = 0;
         _loc3_ = int(param1.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = int(param1[_loc2_]);
            _loc6_ = 1;
            while(_loc6_ < _loc4_ * 2)
            {
               param1[_loc2_ + _loc6_] = _1758(param1[_loc2_ + _loc6_]).name;
               _loc6_ += 2;
            }
            _loc2_ += _loc4_ * 2 + 1;
         }
      }
      
      private static function _1758(param1:int) : _52
      {
         return _1802[param1];
      }
      
      private static function _1785(param1:Mesh, param2:Array, param3:Array, param4:Array) : void
      {
         var _loc5_:Object = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:String = null;
         var _loc10_:Array = null;
         var _loc11_:int = 0;
         if(Boolean(param2) && param2.length > 0)
         {
            (_loc5_ = {})[_101.BONE] = param2;
            _loc5_[_101.A_SLOT_POSE] = _1819(param3);
            _loc5_[_101.A_BONE_POSE] = [];
            _loc6_ = 0;
            _loc7_ = int(param4.length);
            while(_loc6_ < _loc7_)
            {
               _loc8_ = int(param4[_loc6_]);
               _loc9_ = _1758(_loc8_).name;
               _loc10_ = [];
               _loc11_ = 0;
               while(_loc11_ < 6)
               {
                  _loc10_.push(param4[_loc6_ + 1 + _loc11_]);
                  _loc11_++;
               }
               _loc5_[_101.A_BONE_POSE].push({
                  "bone":_loc9_,
                  "pose":_1819(_loc10_)
               });
               _loc6_ += 7;
            }
            param1._1831 = _loc5_;
         }
      }
      
      private static function _1754(param1:String, param2:Object) : String
      {
         var _loc3_:RegExp = null;
         var _loc4_:String = null;
         var _loc5_:int = 0;
         for(_loc4_ in param2)
         {
            if(_loc4_ == param1)
            {
               return param2[_loc4_].path;
            }
            _loc5_ = int(_loc4_.indexOf("/" + param1));
            if(_loc5_ != -1 && _loc5_ + 1 + param1.length == _loc4_.length)
            {
               return param2[_loc4_].path;
            }
         }
         return "";
      }
      
      private static function _11275(param1:Object, param2:Boolean, param3:Boolean) : _70
      {
         var _loc8_:_70 = null;
         var _loc4_:uint = 0;
         if(param2)
         {
            if(!param3)
            {
               _loc4_ = _1815(param1,_101.A_ID,0);
            }
         }
         var _loc5_:String = param1[_101.A_NAME];
         var _loc6_:String = param1[_101.A_TYPE];
         var _loc7_:_11219 = _11277(param1,param2);
         _loc8_ = _70._11276(_loc7_);
         _1767(param1[_101.TRANSFORM],_loc8_.localTransform,new Point());
         _loc8_.localTransform._1738();
         _loc8_._13228 = param1[_101.A_NAME];
         return _loc8_;
      }
      
      private static function _11277(param1:Object, param2:Boolean) : _11219
      {
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:_661 = null;
         var _loc3_:_11219 = new _11219(false);
         _loc3_.color = uint(_1815(param1,_101.COLOR,0));
         if(_loc3_.color == 0)
         {
            _loc3_.color = _100.BOUNDINGBOX_COLOR;
         }
         _loc3_.name = param1[_101.A_NAME];
         switch(param1[_101.SUB_TYPE])
         {
            case _101.ELLIPSE:
               _loc3_.type = BoundingBoxType.ELLIPSE;
               _loc3_.width = _1815(param1,_101.A_WIDTH,0);
               _loc3_.height = _1815(param1,_101.A_HEIGHT,0);
               break;
            case _101.BOUNDINGBOX_POLYGON:
               _loc3_.type = BoundingBoxType.POLYGON;
               _loc4_ = param1[_101.A_VERTICES];
               if((Boolean(_loc4_)) && _loc4_.length >= 6)
               {
                  _loc6_ = int(_loc4_.length);
                  _loc5_ = 0;
                  while(_loc5_ < _loc6_)
                  {
                     _loc7_ = new _661(_loc4_[_loc5_],_loc4_[_loc5_ + 1],_loc5_);
                     _loc3_.vertices.push(_loc7_);
                     _loc5_ += 2;
                  }
               }
               break;
            case _101.BOUNDINGBOX_RECTANGLE:
            default:
               _loc3_.type = BoundingBoxType.RECTANGLE;
               _loc3_.width = _1815(param1,_101.A_WIDTH,0);
               _loc3_.height = _1815(param1,_101.A_HEIGHT,0);
         }
         return _loc3_;
      }
      
      private static function _1730(param1:Object, param2:uint, param3:_50, param4:Array, param5:Array, param6:Boolean, param7:Boolean) : _13502
      {
         var _loc11_:Object = null;
         var _loc12_:Object = null;
         var _loc13_:Array = null;
         var _loc17_:_13504 = null;
         var _loc18_:_13508 = null;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:_13507 = null;
         var _loc22_:_14035 = null;
         var _loc23_:_13509 = null;
         var _loc24_:_13506 = null;
         var _loc8_:uint = 0;
         if(param6)
         {
            if(!param7)
            {
               _loc8_ = uint(param1[_101.A_ID]);
            }
         }
         var _loc9_:_13502;
         (_loc9_ = new _13502()).name = param1[_101.A_NAME];
         _loc9_.frameRate = param2;
         _loc9_.duration = int(_1815(param1,_101.A_DURATION,0));
         _loc9_.playTimes = int(_1815(param1,_101.A_PLAY_TIMES,1));
         _loc9_.fadeInTime = _1815(param1,_101.A_FADE_IN_TIME,0) || 0;
         _loc9_.tweenEasing = _1815(param1,_101.A_TWEEN_EASING,NaN);
         _loc9_.autoTween = false;
         _loc9_._1746 = [];
         _loc9_._1745 = [];
         _loc9_._1753 = [];
         var _loc10_:Object = {};
         for each(_loc11_ in param1[_101.BONE])
         {
            _loc17_ = _13574(_loc11_,0,param2,param4,_loc9_.autoTween,param6,param7);
            if(_loc17_._1823 != null)
            {
               _loc17_.parent = _loc9_;
               if(_loc10_[_loc17_._1823.name] == null)
               {
                  _loc10_[_loc17_._1823.name] = _loc17_;
                  _loc9_._1746.push(_loc17_);
               }
            }
         }
         for each(_loc12_ in param1[_101.SLOT])
         {
            _loc18_ = _13575(_loc12_,param5,_loc9_.autoTween,param6);
            if(_loc18_)
            {
               _loc18_.parent = _loc9_;
               _loc9_._1745.push(_loc18_);
            }
         }
         _loc13_ = param1[_101.FFD];
         if((Boolean(_loc13_)) && _loc13_.length > 0)
         {
            _loc19_ = 0;
            _loc20_ = int(_loc13_.length);
            while(_loc19_ < _loc20_)
            {
               _loc21_ = _13577(_loc13_[_loc19_],param5,_loc9_.autoTween,param6);
               if(_loc21_)
               {
                  _loc21_.parent = _loc9_;
                  _loc9_._1753.push(_loc21_);
               }
               _loc19_++;
            }
         }
         var _loc14_:Array = param1[_101.IK];
         if((Boolean(_loc14_)) && _loc14_.length > 0)
         {
            if(_loc9_._14271 == null)
            {
               _loc9_._14271 = [];
            }
            _loc19_ = 0;
            _loc20_ = int(_loc14_.length);
            while(_loc19_ < _loc20_)
            {
               _loc22_ = _14269(_loc14_[_loc19_],param3,_loc9_.autoTween,param6);
               if(_loc22_)
               {
                  _loc22_.parent = _loc9_;
                  _loc9_._14271.push(_loc22_);
               }
               _loc19_++;
            }
         }
         var _loc15_:Object = param1[_101.Z_ORDER];
         if(_loc9_._10657 == null)
         {
            _loc9_._10657 = new _13509(param3);
            _loc9_._10657.parent = _loc9_;
         }
         if(_loc15_)
         {
            _loc23_ = _13571(_loc15_,_loc9_._10657,param3,param5,param6);
            if(_loc23_)
            {
               _loc9_._10657 = _loc23_;
               _loc23_.parent = _loc9_;
            }
         }
         var _loc16_:Object = param1;
         if(_loc9_._13597 == null)
         {
            _loc9_._13597 = new _13506(param3);
            _loc9_._13597.parent = _loc9_;
         }
         if(Boolean(_loc16_) && Boolean(_loc16_[_101.FRAME]))
         {
            _loc24_ = _13573(_loc16_,_loc9_._13597,param3,param4,param6);
            if(_loc24_)
            {
               _loc9_._13597 = _loc24_;
               _loc24_.parent = _loc9_;
            }
         }
         if(param3._1811 == SymbolType.SHEET && !param6)
         {
            param3.playTimes = _loc9_.playTimes;
         }
         return _loc9_;
      }
      
      private static function _13574(param1:Object, param2:int, param3:uint, param4:Array, param5:Boolean, param6:Boolean, param7:Boolean) : _13504
      {
         var _loc12_:_13510 = null;
         var _loc13_:_13510 = null;
         var _loc14_:_13510 = null;
         var _loc8_:_13504 = new _13504();
         var _loc9_:String = param1[_101.A_NAME];
         _13576(param1,_loc8_);
         var _loc10_:int = 0;
         var _loc11_:int = int(param4.length);
         while(_loc10_ < _loc11_)
         {
            if(param4[_loc10_].name == _loc9_)
            {
               _loc8_._1823 = param4[_loc10_] as _52;
               break;
            }
            _loc10_++;
         }
         if(param1[_101.TRANSLATE_FRAME] != null)
         {
            _loc12_ = _13591(param1[_101.TRANSLATE_FRAME],_loc8_._13581,_13589,param6);
            if(_loc12_)
            {
               _loc12_.parent = _loc8_;
               _loc8_._13581 = _loc12_;
            }
         }
         if(param1[_101.ROTATE_FRAME] != null)
         {
            _loc13_ = _13591(param1[_101.ROTATE_FRAME],_loc8_._13586,_13584,param6);
            if(_loc13_)
            {
               _loc13_.parent = _loc8_;
               _loc8_._13586 = _loc13_;
            }
         }
         if(param1[_101.SCALE_FRAME] != null)
         {
            _loc14_ = _13591(param1[_101.SCALE_FRAME],_loc8_._13598,_13588,param6);
            if(_loc14_)
            {
               _loc14_.parent = _loc8_;
               _loc8_._13598 = _loc14_;
            }
         }
         return _loc8_;
      }
      
      private static function _13575(param1:Object, param2:Array, param3:Boolean, param4:Boolean) : _13508
      {
         var _loc10_:_13510 = null;
         var _loc11_:_13510 = null;
         var _loc12_:_13510 = null;
         var _loc5_:_13508 = new _13508();
         var _loc6_:String = param1[_101.A_NAME];
         _13576(param1,_loc5_);
         var _loc7_:int = 0;
         var _loc8_:int = int(param2.length);
         while(_loc7_ < _loc8_)
         {
            if(param2[_loc7_].name == _loc6_)
            {
               _loc5_._1824 = param2[_loc7_] as _79;
               break;
            }
            _loc7_++;
         }
         if(_loc5_._1824 == null)
         {
            return null;
         }
         var _loc9_:_79 = _loc5_._1824;
         if(param1[_101.COLOR_FRAME] != null)
         {
            _loc10_ = _13591(param1[_101.COLOR_FRAME],_loc5_._13599,_13590,param4);
            if(_loc10_)
            {
               _loc10_.parent = _loc5_;
               _loc5_._13599 = _loc10_;
            }
         }
         if(param1[_101.DISPLAY_FRAME] != null)
         {
            _loc11_ = _13568(param1[_101.DISPLAY_FRAME],_loc5_._13572,_loc9_,param4);
            if(_loc11_)
            {
               _loc11_.parent = _loc5_;
               _loc5_._13572 = _loc11_;
            }
         }
         if(param1[_101.VISIBLE_FRAME] != null)
         {
            _loc12_ = _13591(param1[_101.VISIBLE_FRAME],_loc5_._13592,_13578,param4);
            if(_loc12_)
            {
               _loc12_.parent = _loc5_;
               _loc5_._13592 = _loc12_;
            }
         }
         return _loc5_;
      }
      
      private static function _14269(param1:Object, param2:_50, param3:Boolean, param4:Boolean) : _14035
      {
         var _loc7_:_77 = null;
         var _loc8_:Boolean = false;
         var _loc5_:_14035 = new _14035();
         var _loc6_:String = param1[_101.A_NAME];
         _13576(param1,_loc5_);
         var _loc9_:int = 0;
         var _loc10_:int = int(param2._1999.length);
         while(_loc9_ < _loc10_)
         {
            _loc7_ = param2._1999[_loc9_] as _77;
            if(_loc7_.name == _loc6_)
            {
               _loc5_._2942 = _loc7_;
            }
            _loc9_++;
         }
         if(_loc5_._2942 == null)
         {
            return null;
         }
         _13591(param1[_101.FRAME],_loc5_,_14272,param4);
         return _loc5_;
      }
      
      private static function _13577(param1:Object, param2:Array, param3:Boolean, param4:Boolean) : _13507
      {
         var _loc8_:_79 = null;
         var _loc9_:_70 = null;
         var _loc10_:Boolean = false;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc5_:_13507 = new _13507();
         var _loc6_:String = param1[_101.A_NAME];
         var _loc7_:String = param1[_101.SLOT];
         _13576(param1,_loc5_);
         var _loc11_:int = 0;
         var _loc12_:int = int(param2.length);
         while(_loc11_ < _loc12_)
         {
            _loc8_ = param2[_loc11_] as _79;
            if(_loc8_.name == _loc7_)
            {
               _loc10_ = false;
               _loc13_ = 0;
               _loc14_ = int(_loc8_._1715.length);
               while(_loc13_ < _loc14_)
               {
                  _loc9_ = _loc8_._1765[_loc8_._1715[_loc13_]] as _70;
                  if((_loc9_) && _loc9_._13228 == _loc6_ && _loc9_.type == _74.MESH)
                  {
                     _loc5_._1826 = _loc9_;
                     _loc10_ = true;
                     break;
                  }
                  _loc13_++;
               }
               if(_loc10_)
               {
                  break;
               }
            }
            _loc11_++;
         }
         if(_loc5_._1826 == null)
         {
            return null;
         }
         _13591(param1[_101.FRAME],_loc5_,_13569,param4);
         return _loc5_;
      }
      
      private static function _13571(param1:Object, param2:_13509, param3:_50, param4:Array, param5:Boolean) : _13509
      {
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Array = null;
         var _loc10_:_13496 = null;
         var _loc6_:Array = param1[_101.FRAME];
         if((Boolean(_loc6_)) && _loc6_.length > 0)
         {
            _loc9_ = [];
            _loc7_ = 0;
            _loc8_ = int(_loc6_.length);
            while(_loc7_ < _loc8_)
            {
               _loc10_ = _13579(_loc6_[_loc7_],param4,param5);
               if(_loc10_)
               {
                  _loc9_.push(_loc10_);
               }
               _loc7_++;
            }
            _13585(_loc9_,param2,param5);
         }
         return param2;
      }
      
      private static function _13573(param1:Object, param2:_13506, param3:_50, param4:Array, param5:Boolean) : _13506
      {
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Array = null;
         var _loc10_:_13496 = null;
         var _loc6_:Array = param1[_101.FRAME];
         if((Boolean(_loc6_)) && _loc6_.length > 0)
         {
            _loc9_ = [];
            _loc7_ = 0;
            _loc8_ = int(_loc6_.length);
            while(_loc7_ < _loc8_)
            {
               _loc10_ = _13587(_loc6_[_loc7_],param3,param5);
               if(_loc10_)
               {
                  _loc9_.push(_loc10_);
               }
               _loc7_++;
            }
            _13585(_loc9_,param2,param5);
         }
         return param2;
      }
      
      private static function _13591(param1:Array, param2:_13510, param3:Function, param4:Boolean) : _13510
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Array = null;
         var _loc8_:_13496 = null;
         if(Boolean(param1) && param1.length > 0)
         {
            _loc7_ = [];
            _loc5_ = 0;
            _loc6_ = int(param1.length);
            while(_loc5_ < _loc6_)
            {
               _loc8_ = param3(param1[_loc5_]);
               if(_loc8_)
               {
                  _loc7_.push(_loc8_);
               }
               _loc5_++;
            }
            return _13585(_loc7_,param2,param4);
         }
         return param2;
      }
      
      private static function _13568(param1:Array, param2:_13510, param3:_79, param4:Boolean) : _13510
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Array = null;
         var _loc8_:_13496 = null;
         if(Boolean(param1) && param1.length > 0)
         {
            _loc7_ = [];
            _loc5_ = 0;
            _loc6_ = int(param1.length);
            while(_loc5_ < _loc6_)
            {
               _loc8_ = _13570(param1[_loc5_],param3);
               if(_loc8_)
               {
                  _loc7_.push(_loc8_);
               }
               _loc5_++;
            }
            return _13585(_loc7_,param2,param4);
         }
         return null;
      }
      
      private static function _13585(param1:Array, param2:_13510, param3:Boolean) : _13510
      {
         var _loc4_:int = 0;
         var _loc5_:_13496 = null;
         var _loc6_:Array = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         if(Boolean(param1) && param1.length > 0)
         {
            _loc4_ = 0;
            _loc6_ = [];
            _loc7_ = 0;
            _loc8_ = int(param1.length - 1);
            while(_loc7_ < _loc8_)
            {
               _loc5_ = param1[_loc7_];
               if(_loc5_.duration > 0)
               {
                  _loc6_.push(_loc5_);
               }
               _loc7_++;
            }
            _loc6_.push(param1[_loc8_]);
            param1 = _loc6_;
            _loc7_ = 0;
            _loc8_ = int(param1.length);
            while(_loc7_ < _loc8_)
            {
               (_loc5_ = param1[_loc7_]).startPos = _loc4_;
               _loc4_ += _loc5_.duration;
               _loc7_++;
            }
            if(_loc5_.duration > 0)
            {
               _loc5_.duration = 0;
            }
            if(param3)
            {
               if(param1[0].isFillFirst)
               {
                  param1.shift();
               }
            }
            if(param2 == null)
            {
               param2 = new _13510(param1);
            }
            else
            {
               param2._1816 = param1;
            }
            return param2;
         }
         return null;
      }
      
      private static function _13590(param1:Object) : _13494
      {
         var _loc2_:_13494 = null;
         if(param1)
         {
            _loc2_ = new _13494();
            if(param1[_101.COLOR])
            {
               _1727(param1[_101.COLOR],_loc2_._13601,true);
            }
            else if(param1[_101.VALUE])
            {
               _1727(param1[_101.VALUE],_loc2_._13601,true);
            }
            _13594(param1,_loc2_);
            return _loc2_;
         }
         return null;
      }
      
      private static function _13589(param1:Object) : _13498
      {
         var _loc2_:_13498 = null;
         var _loc3_:Point = null;
         if(param1)
         {
            _loc2_ = new _13498();
            _loc3_ = new Point();
            _loc3_.x = _1815(param1,"x",0);
            _loc3_.y = _1815(param1,"y",0);
            _loc2_.value = _loc3_;
            _13594(param1,_loc2_);
            return _loc2_;
         }
         return null;
      }
      
      private static function _13588(param1:Object) : _13498
      {
         var _loc2_:_13498 = null;
         var _loc3_:Point = null;
         if(param1)
         {
            _loc2_ = new _13498();
            _loc3_ = new Point();
            _loc3_.x = _1815(param1,"x",1);
            _loc3_.y = _1815(param1,"y",1);
            _loc2_.value = _loc3_;
            _13594(param1,_loc2_);
            return _loc2_;
         }
         return null;
      }
      
      private static function _13584(param1:Object) : _13499
      {
         var _loc2_:_13499 = null;
         if(param1)
         {
            _loc2_ = new _13499();
            _loc2_.value = _1815(param1,_101.ROTATE,0) * _101.ANGLE_TO_RADIAN || 0;
            _loc2_.tweenRotate = _1815(param1,_101.CLOCKWISE,0);
            _13594(param1,_loc2_);
            return _loc2_;
         }
         return null;
      }
      
      private static function _13583(param1:Object) : _13497
      {
         var _loc2_:_13497 = null;
         if(param1)
         {
            _loc2_ = new _13497();
            _loc2_.value = _1815(param1,_101.VALUE,0);
            _13594(param1,_loc2_);
            return _loc2_;
         }
         return null;
      }
      
      private static function _13578(param1:Object) : _13493
      {
         var _loc2_:_13493 = null;
         if(param1)
         {
            _loc2_ = new _13493();
            _loc2_.value = _1798(param1,_101.VALUE,false);
            _13594(param1,_loc2_);
            return _loc2_;
         }
         return null;
      }
      
      private static function _13582(param1:Object) : _13500
      {
         var _loc2_:_13500 = null;
         if(param1)
         {
            _loc2_ = new _13500();
            _loc2_.value = param1[_101.VALUE];
            _13594(param1,_loc2_);
            return _loc2_;
         }
         return null;
      }
      
      private static function _14272(param1:Object) : _14034
      {
         var _loc2_:_14034 = null;
         if(param1)
         {
            _loc2_ = new _14034();
            _loc2_.value = _1815(param1,_101.A_IK_WEIGHT,1);
            _loc2_.bend = _1798(param1,_101.A_IK_BENDPOSITIVE,true) ? 1 : -1;
            _13594(param1,_loc2_);
            return _loc2_;
         }
         return null;
      }
      
      private static function _13570(param1:Object, param2:_79) : _13495
      {
         var _loc3_:_13495 = null;
         var _loc4_:int = 0;
         var _loc5_:Array = null;
         if(param1)
         {
            _loc3_ = new _13495();
            _loc4_ = int(_1815(param1,_101.VALUE,0));
            if(_loc4_ >= 0)
            {
               _loc3_.value = param2._1715[_loc4_];
            }
            if(param1[_101.A_GOTOANDPLAY])
            {
               _loc3_._13603 = param1[_101.A_GOTOANDPLAY];
            }
            else if(param1[_101.A_ACTIONS])
            {
               _loc5_ = param1[_101.A_ACTIONS];
               if((_loc5_) && _loc5_.length == 1 && _loc5_[0] != null)
               {
                  _loc3_._13603 = _loc5_[0][_101.A_GOTOANDPLAY];
               }
            }
            _13594(param1,_loc3_);
            return _loc3_;
         }
         return null;
      }
      
      private static function _13569(param1:Object) : _13501
      {
         var _loc4_:_13501 = null;
         var _loc5_:Vector.<Number> = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc2_:int = int(param1[_101.A_OFFSET]);
         var _loc3_:Array = param1[_101.A_VERTICES];
         if(param1)
         {
            _loc4_ = new _13501();
            _loc5_ = new Vector.<Number>();
            _loc6_ = 0;
            if(Boolean(_loc3_) && _loc3_.length > 0)
            {
               _loc7_ = _loc2_ + _loc3_.length;
               _loc6_ = 0;
               while(_loc6_ < _loc7_)
               {
                  if(_loc6_ < _loc2_)
                  {
                     _loc5_.push(0);
                  }
                  else
                  {
                     _loc5_.push(_loc3_[_loc6_ - _loc2_]);
                  }
                  _loc6_++;
               }
            }
            _loc4_.value = _loc5_;
            _13594(param1,_loc4_);
            return _loc4_;
         }
         return null;
      }
      
      private static function _13579(param1:Object, param2:Array, param3:Boolean) : _13491
      {
         var _loc4_:_13491 = null;
         var _loc5_:Array = null;
         var _loc6_:Array = null;
         var _loc7_:Array = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         if(param1)
         {
            _loc4_ = new _13491();
            _loc5_ = param1[_101.Z_ORDER];
            if(_loc5_ == null)
            {
               _loc5_ = [];
            }
            if(param3)
            {
               _loc4_.value = _loc5_;
            }
            else
            {
               _loc6_ = _10600._10660(param2.length,_loc5_);
               _loc7_ = [];
               _loc8_ = 0;
               _loc9_ = int(_loc6_.length);
               while(_loc8_ < _loc9_)
               {
                  if(!isNaN(_loc6_[_loc8_]))
                  {
                     _loc7_.push(param2[_loc6_[_loc8_]].name);
                  }
                  _loc8_++;
               }
               _loc4_.value = _loc7_;
            }
            _13594(param1,_loc4_);
            return _loc4_;
         }
         return null;
      }
      
      private static function _13587(param1:Object, param2:_50, param3:Boolean) : _13491
      {
         var _loc4_:_13491 = null;
         var _loc5_:_44 = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:String = null;
         var _loc10_:String = null;
         var _loc11_:String = null;
         var _loc12_:Array = null;
         var _loc13_:Array = null;
         var _loc14_:Object = null;
         var _loc15_:int = 0;
         var _loc16_:Number = NaN;
         var _loc17_:String = null;
         if(param1)
         {
            _loc4_ = new _13491();
            _loc6_ = 0;
            _loc7_ = 0;
            _loc8_ = 0;
            _loc9_ = param1[_101.A_ACTION];
            _loc10_ = param1[_101.A_EVENT];
            _loc11_ = param1[_101.A_SOUND];
            _loc12_ = [];
            if(param3)
            {
               _loc6_ = int(param1[_101.A_ACTION + _101.A_ID]);
               _loc7_ = int(param1[_101.A_EVENT + _101.A_ID]);
               _loc8_ = int(param1[_101.A_SOUND + _101.A_ID]);
            }
            if(_loc9_ != null && _loc9_ != "")
            {
               _loc12_.push(_44.create(_75.GOTO_AND_PLAY,_loc9_,_loc6_));
            }
            if(_loc10_ != null && _loc10_ != "")
            {
               _loc12_.push(_44.create(_75.DISPATCH_EVENT,_loc10_,_loc7_));
            }
            if(_loc11_ != null && _loc11_ != "")
            {
               _loc12_.push(_44.create(_75.SOUND,_loc11_,_loc8_));
            }
            if(_101.EVENTS in param1)
            {
               _loc13_ = param1[_101.EVENTS];
               for each(_loc14_ in _loc13_)
               {
                  _loc5_ = _44.create(_75.DISPATCH_EVENT,_loc14_[_101.A_NAME]);
                  _loc5_.event.bone = param2._1817(_loc14_[_101.BONE]);
                  _loc5_.event.slot = param2._1818(_loc14_[_101.SLOT]);
                  if(_101.INTS in _loc14_)
                  {
                     for each(_loc15_ in _loc14_[_101.INTS])
                     {
                        _loc5_.event.ints.push(_loc15_);
                     }
                  }
                  if(_101.FLOATS in _loc14_)
                  {
                     for each(_loc16_ in _loc14_[_101.FLOATS])
                     {
                        _loc5_.event.floats.push(_loc16_);
                     }
                  }
                  if(_101.STRINGS in _loc14_)
                  {
                     for each(_loc17_ in _loc14_[_101.STRINGS])
                     {
                        _loc5_.event.strings.push(_loc17_);
                     }
                  }
                  _loc12_.push(_loc5_);
               }
            }
            _loc4_.value = _loc12_;
            _13594(param1,_loc4_);
            return _loc4_;
         }
         return null;
      }
      
      private static function _13594(param1:Object, param2:_13496) : void
      {
         var _loc3_:Array = null;
         if(Boolean(param1) && Boolean(param2))
         {
            param2.isFillFirst = param1[_101.IS_FILL_FIRST];
            param2.duration = int(param1[_101.A_DURATION]) || 1;
            if(param1.curve != null && param1.curve.length > 0)
            {
               param2.tweenType = 2;
            }
            else if(!isNaN(_1815(param1,_101.A_TWEEN_EASING,NaN)))
            {
               param2.tweenType = 1;
            }
            else
            {
               param2.tweenType = 0;
            }
            _loc3_ = param1[_101.CURVE];
            if(Boolean(_loc3_) && _loc3_.length > 0)
            {
               _loc3_ = _loc3_.concat();
               _loc3_.unshift(0,0);
               _loc3_.push(1,1);
               param2.tweenCurve = new Curve();
               param2.tweenCurve.fromArray(_loc3_);
               param2.tweenCurve._11514(30);
            }
         }
      }
      
      private static function _13576(param1:Object, param2:_13510) : void
      {
         param2.scale = _1815(param1,_101.A_SCALE,1) || 1;
         param2.offset = _1815(param1,_101.A_OFFSET,0) || 0;
      }
      
      private static function _1767(param1:Object, param2:_86, param3:Point = null, param4:Boolean = false) : void
      {
         if(param1)
         {
            if(param2)
            {
               param2.x = _1815(param1,_101.A_X,0) || 0;
               param2.y = _1815(param1,_101.A_Y,0) || 0;
               param2.skewX = _1815(param1,_101.A_SKEW_X,0) * _101.ANGLE_TO_RADIAN || 0;
               param2.skewY = _1815(param1,_101.A_SKEW_Y,0) * _101.ANGLE_TO_RADIAN || 0;
               param2.scaleX = _1815(param1,_101.A_SCALE_X,1) || 0;
               param2.scaleY = _1815(param1,_101.A_SCALE_Y,1) || 0;
            }
            if(param3)
            {
               param3.x = _1815(param1,_101.A_PIVOT_X,0) || 0;
               param3.y = _1815(param1,_101.A_PIVOT_Y,0) || 0;
               param2.x -= param3.x;
               param2.y -= param3.y;
            }
         }
      }
      
      private static function _1727(param1:Object, param2:ColorTransform, param3:Boolean) : void
      {
         if(param1)
         {
            if(param2)
            {
               param2.alphaOffset = int(param1[_101.A_ALPHA_OFFSET]);
               param2.redOffset = int(param1[_101.A_RED_OFFSET]);
               param2.greenOffset = int(param1[_101.A_GREEN_OFFSET]);
               param2.blueOffset = int(param1[_101.A_BLUE_OFFSET]);
               param2.alphaMultiplier = _1815(param1,_101.A_ALPHA_MULTIPLIER,100) / 100;
               param2.redMultiplier = _1815(param1,_101.A_RED_MULTIPLIER,100) / 100;
               param2.greenMultiplier = _1815(param1,_101.A_GREEN_MULTIPLIER,100) / 100;
               param2.blueMultiplier = _1815(param1,_101.A_BLUE_MULTIPLIER,100) / 100;
            }
         }
      }
      
      private static function _1798(param1:Object, param2:String, param3:Boolean) : Boolean
      {
         if(Boolean(param1) && param2 in param1)
         {
            switch(String(param1[param2]))
            {
               case "0":
               case "NaN":
               case "":
               case "false":
               case "null":
               case "undefined":
                  return false;
               case "1":
               case "true":
            }
            return true;
         }
         return param3;
      }
      
      private static function _1815(param1:Object, param2:String, param3:Number) : Number
      {
         if(Boolean(param1) && param2 in param1)
         {
            switch(String(param1[param2]))
            {
               case "NaN":
               case "":
               case "false":
               case "null":
               case "undefined":
                  return NaN;
               default:
                  return Number(param1[param2]);
            }
         }
         else
         {
            return param3;
         }
      }
      
      private static function _1819(param1:Array) : Matrix
      {
         var _loc2_:Matrix = new Matrix();
         if(Boolean(param1) && param1.length == 6)
         {
            _loc2_.setTo(param1[0],param1[1],param1[2],param1[3],param1[4],param1[5]);
         }
         return _loc2_;
      }
   }
}

