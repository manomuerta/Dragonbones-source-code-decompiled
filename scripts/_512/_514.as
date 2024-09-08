package _512
{
   import _521._527;
   import _625._627;
   import _648.PluginModel;
   import _81._86;
   import _81._88;
   import _97._101;
   import egret.utils.FileUtil;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.utils.ByteArray;
   
   public class _514 extends _513
   {
      private var _3721:Vector.<Matrix>;
      
      public function _514()
      {
         this._3721 = new Vector.<Matrix>();
         super();
      }
      
      override public function run() : void
      {
         var _loc1_:String = null;
         var _loc3_:Object = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc7_:ByteArray = null;
         _loc1_ = _3287._3714;
         var _loc2_:String = FileUtil.getExtension(_loc1_);
         _loc2_ = _loc2_.toLowerCase();
         var _loc4_:PluginModel = _3287._3717;
         switch(_loc2_)
         {
            case _627.XML_SUFFIX:
               _loc3_ = XML(FileUtil.openAsString(_loc1_));
               break;
            case _627.JSON_SUFFIX:
               _loc5_ = FileUtil.openAsString(_loc1_);
               if(_loc4_)
               {
                  if(_loc4_._3668.checkDataValid(_loc5_))
                  {
                     _loc3_ = JSON.parse(_loc4_._3668.convertToDBData(_loc5_));
                  }
                  else
                  {
                     fail(_627.ERROR_NO_DRAGONBONES_DATA);
                  }
               }
               else
               {
                  _loc3_ = JSON.parse(_loc5_);
               }
               break;
            case _627.AMF3_SUFFIX:
               _loc7_ = FileUtil.openAsByteArray(_loc1_);
               _loc7_.uncompress();
               _loc3_ = _loc7_.readObject();
               break;
            default:
               if(_loc4_)
               {
                  _loc5_ = FileUtil.openAsString(_loc1_);
                  if(_loc4_._3668.checkDataValid(_loc5_))
                  {
                     _loc6_ = _loc4_._3668.convertToDBData(_loc5_);
                     _loc3_ = JSON.parse(_loc6_);
                  }
                  else
                  {
                     _527.getInstance()._2377("Error:: DragonBonesData:" + _loc1_);
                     fail(_627.ERROR_NO_DRAGONBONES_DATA);
                  }
               }
               else
               {
                  fail(_627.ERROR_NO_DRAGONBONES_DATA);
               }
         }
         if(!_loc3_ || !_loc3_.hasOwnProperty("armature"))
         {
            fail(_627.ERROR_NO_DRAGONBONES_DATA);
         }
         else
         {
            _527.getInstance()._2377("Finish:: DragonBonesData:" + _loc1_);
            _3287._1717 = _loc3_;
            complete();
         }
      }
      
      private function _3722(param1:Object) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Object = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         this._3715(param1);
         _loc2_ = 0;
         _loc3_ = int(param1.armature[0].skin[0].slot.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = 0;
            _loc5_ = int(param1.armature[0].skin[0].slot[_loc2_].display.length);
            while(_loc4_ < _loc5_)
            {
               _loc6_ = param1.armature[0].skin[0].slot[_loc2_].display[_loc4_];
               if(_loc6_.type == "weightedmesh")
               {
                  _loc7_ = 0;
                  _loc8_ = int(_loc6_.vertices.length);
                  while(_loc7_ < _loc8_)
                  {
                     if(_loc7_ % 2 == 1)
                     {
                        _loc6_.vertices[_loc7_] = -_loc6_.vertices[_loc7_];
                     }
                     _loc7_++;
                  }
               }
               _loc4_++;
            }
            _loc2_++;
         }
         _loc2_ = 0;
         _loc3_ = int(param1.armature[0].skin[0].slot.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = 0;
            _loc5_ = int(param1.armature[0].skin[0].slot[_loc2_].display.length);
            while(_loc4_ < _loc5_)
            {
               _loc6_ = param1.armature[0].skin[0].slot[_loc2_].display[_loc4_];
               if(_loc6_.type == "weightedmesh")
               {
                  this._3716(_loc6_);
               }
               _loc4_++;
            }
            _loc2_++;
         }
      }
      
      private function _3715(param1:Object) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Object = null;
         _loc2_ = 0;
         _loc3_ = int(param1.armature[0].bone.length);
         while(_loc2_ < _loc3_)
         {
            (_loc4_ = param1.armature[0].bone[_loc2_]).matrix = this._3719(_loc4_.transform);
            this._3721[_loc2_] = _loc4_.matrix;
            _loc2_++;
         }
      }
      
      private function _3719(param1:Object) : Matrix
      {
         var _loc2_:_86 = new _86();
         if(param1)
         {
            _loc2_.x = !!param1.x ? Number(param1.x) : 0;
            _loc2_.y = !!param1.y ? Number(param1.y) : 0;
            _loc2_.skewX = !!param1.skX ? param1.skX * _101.ANGLE_TO_RADIAN : 0;
            _loc2_.skewY = !!param1.skY ? param1.skY * _101.ANGLE_TO_RADIAN : 0;
            _loc2_.scaleX = !!param1.scX ? Number(param1.scX) : 1;
            _loc2_.scaleY = !!param1.scY ? Number(param1.scY) : 1;
         }
         var _loc3_:Matrix = new Matrix();
         _88._2013(_loc2_,_loc3_);
         return _loc3_;
      }
      
      private function _3716(param1:Object) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Array = null;
         var _loc11_:Point = null;
         var _loc2_:Array = [];
         var _loc3_:Array = param1.vertices;
         var _loc6_:Array = [];
         _loc7_ = 0;
         _loc5_ = int(_loc3_.length);
         while(_loc7_ < _loc5_)
         {
            _loc4_ = int(_loc3_[_loc7_]);
            _loc6_.push(_loc4_);
            _loc8_ = _loc7_ + 1;
            while(_loc8_ < _loc7_ + _loc4_ * 4 + 1)
            {
               _loc6_.push(_loc3_[_loc8_]);
               _loc6_.push(_loc3_[_loc8_ + 3]);
               _loc8_ += 4;
            }
            _loc7_ += _loc4_ * 4 + 1;
         }
         while(_loc3_.length > 0)
         {
            _loc4_ = int(_loc3_[0]);
            _loc5_ = _loc4_ * 4 + 1;
            _loc10_ = _loc3_.splice(0,_loc5_);
            _loc11_ = this._3723(_loc10_);
            _loc2_.push(_loc11_.x,_loc11_.y);
         }
         param1.type = "mesh";
         param1.vertices = _loc2_;
         param1.bonePose = this._3720();
         param1.slotPose = [1,0,0,1,0,0];
         param1.weights = _loc6_;
      }
      
      private function _3723(param1:Array) : Point
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Matrix = null;
         var _loc5_:Number = NaN;
         var _loc6_:Point = new Point();
         var _loc7_:Point = new Point();
         _loc2_ = 1;
         _loc3_ = int(param1.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = this._3718(param1[_loc2_]);
            _loc6_.x = param1[_loc2_ + 1];
            _loc6_.y = -param1[_loc2_ + 2];
            _loc5_ = Number(param1[_loc2_ + 3]);
            _loc6_ = _loc4_.transformPoint(_loc6_);
            _loc7_.x += _loc6_.x * _loc5_;
            _loc7_.y += _loc6_.y * _loc5_;
            _loc2_ += 4;
         }
         return _loc7_;
      }
      
      private function _3718(param1:int) : Matrix
      {
         return this._3721[param1];
      }
      
      private function _3720() : Array
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc1_:Array = [];
         _loc2_ = 0;
         _loc3_ = int(this._3721.length);
         while(_loc2_ < _loc3_)
         {
            _loc1_.push(_loc2_,this._3721[_loc2_].a,this._3721[_loc2_].b,this._3721[_loc2_].c,this._3721[_loc2_].d,this._3721[_loc2_].tx,this._3721[_loc2_].ty);
            _loc2_++;
         }
         return _loc1_;
      }
   }
}

