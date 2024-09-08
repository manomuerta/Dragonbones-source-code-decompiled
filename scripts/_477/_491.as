package _477
{
   import _120._119;
   import _120._121;
   import _120._122;
   import _13503._13502;
   import _1404._1407;
   import _51._50;
   import _586._596;
   import _73.SymbolType;
   import egret.utils.FileUtil;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class _491 extends _494
   {
      private var _3605:String;
      
      private var _3607:String;
      
      public function _491(param1:String, param2:String)
      {
         super();
         this._3607 = param1;
         this._3605 = param2;
      }
      
      override public function run() : void
      {
         var _loc1_:Array = null;
         var _loc2_:Vector.<_119> = null;
         var _loc3_:Rectangle = null;
         var _loc5_:int = 0;
         var _loc7_:_50 = null;
         var _loc8_:Array = null;
         var _loc9_:_122 = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc4_:int = 0;
         var _loc6_:String = _3238.ouputPath + _3238.outputFolder;
         _3613.ouputPath = FileUtil.escapePath(_loc6_);
         if(this._3605)
         {
            _loc1_ = this._3695(this._3607,this._3605);
         }
         else
         {
            _loc1_ = [];
            _loc7_ = _3238.dragonBonesVO._2107(this._3607);
            _loc4_ = 0;
            _loc5_ = int(_loc7_._13619.length);
            while(_loc4_ < _loc5_)
            {
               _loc8_ = this._3695(this._3607,_loc7_._13619[_loc4_].name);
               _loc1_ = _loc1_.concat(_loc8_);
               _loc4_++;
            }
         }
         if(_loc1_.length > 0)
         {
            if(_3238._13268)
            {
               _loc3_ = _3238._13268.clone();
               _loc3_.x = -_loc3_.x;
               _loc3_.y = -_loc3_.y;
            }
            else
            {
               _loc3_ = this._3698(_loc1_);
            }
            _loc9_ = new _122();
            if(this._3605)
            {
               _loc2_ = this._3694(this._3607,this._3605,_loc3_);
               _loc4_ = 0;
               _loc5_ = int(_loc2_.length);
               while(_loc4_ < _loc5_)
               {
                  _loc9_._2389(_loc2_[_loc4_]);
                  _loc4_++;
               }
            }
            else
            {
               _loc7_ = _3238.dragonBonesVO._2107(this._3607);
               _loc4_ = 0;
               _loc5_ = int(_loc7_._1963.length);
               while(_loc4_ < _loc5_)
               {
                  _loc2_ = this._3694(this._3607,_loc7_._1963[_loc4_].name,_loc3_);
                  _loc10_ = 0;
                  _loc11_ = int(_loc2_.length);
                  while(_loc10_ < _loc11_)
                  {
                     _loc9_._2389(_loc2_[_loc10_]);
                     _loc10_++;
                  }
                  _loc4_++;
               }
            }
            _loc9_.addEventListener(_121.COMPLETE,this._3700);
            _loc9_.addEventListener(_121.FAIL,this._3700);
            _loc9_.addEventListener(_121.PROGRESS,this._3697);
            _loc9_.run();
         }
         else
         {
            fail(ExportController.EXPORT_ERROR_NO_DATA);
         }
      }
      
      private function _3700(param1:_121) : void
      {
         param1.target.removeEventListener(_121.COMPLETE,this._3700);
         param1.target.removeEventListener(_121.FAIL,this._3700);
         param1.target.removeEventListener(_121.PROGRESS,this._3697);
         dispatchEvent(param1);
      }
      
      private function _3697(param1:_121) : void
      {
         dispatchEvent(param1);
      }
      
      private function _3695(param1:String, param2:String) : Array
      {
         var _loc5_:_13502 = null;
         var _loc6_:Number = NaN;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Number = NaN;
         var _loc11_:Object = null;
         var _loc3_:Array = [];
         var _loc4_:_50 = _3238.dragonBonesVO._2107(param1);
         if(_loc4_)
         {
            _loc5_ = _loc4_._13656(param2);
            if(_loc5_)
            {
               this._3443._3606(_loc4_);
               this._3443._3604(_loc5_);
               _loc5_._1874();
               if(_3238.exportFrameRate <= 0)
               {
                  _loc6_ = 1;
               }
               else
               {
                  _loc6_ = _3238.exportFrameRate / _loc5_.frameRate;
               }
               _loc7_ = _loc5_.duration;
               _loc7_ = Math.ceil(_loc7_ * _loc6_);
               if(_loc7_ <= 0)
               {
                  _loc7_ = 1;
               }
               param2 = _loc5_.name;
               _loc8_ = 0;
               _loc9_ = _loc7_;
               while(_loc8_ < _loc9_)
               {
                  _loc10_ = _loc8_ / _loc6_;
                  _loc11_ = this._3443._3696(_loc10_);
                  _loc3_.push(_loc11_);
                  _loc8_++;
               }
               if(_loc10_ < _loc7_ && _loc4_._1811 != SymbolType.SHEET)
               {
                  _loc10_ = _loc7_;
                  _loc11_ = this._3443._3696(_loc10_);
                  _loc3_.push(_loc11_);
               }
               _loc5_._1868();
            }
         }
         return _loc3_;
      }
      
      private function _3694(param1:String, param2:String, param3:Rectangle) : Vector.<_119>
      {
         var _loc6_:_13502 = null;
         var _loc7_:Number = NaN;
         var _loc8_:int = 0;
         var _loc9_:String = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:Number = NaN;
         var _loc4_:Vector.<_119> = new Vector.<_119>();
         var _loc5_:_50 = _3238.dragonBonesVO._2107(param1);
         if(_loc5_)
         {
            _loc6_ = _loc5_._13656(param2);
            if(_loc6_)
            {
               _loc4_.push(new _476(param1,param2));
               if(_3238.exportFrameRate <= 0)
               {
                  _loc7_ = 1;
               }
               else
               {
                  _loc7_ = _3238.exportFrameRate / _loc6_.frameRate;
               }
               _loc8_ = _loc6_.duration;
               _loc8_ = Math.ceil(_loc8_ * _loc7_);
               if(_loc8_ <= 0)
               {
                  _loc8_ = 1;
               }
               _loc9_ = param1 + "_" + _loc6_.name;
               if(_loc5_._1811 == SymbolType.SHEET)
               {
                  _loc9_ = param1;
               }
               param2 = _loc6_.name;
               _loc10_ = 0;
               _loc11_ = _loc8_;
               while(_loc10_ < _loc11_)
               {
                  _loc12_ = _loc10_ / _loc7_;
                  _loc4_.push(new ExportImageFileByFrameIndex(_loc10_,_loc12_,param3.width,param3.height,param3.x,param3.y,_loc9_,_loc5_._1811 == SymbolType.SHEET,_loc8_));
                  _loc10_++;
               }
               if(_loc12_ < _loc8_ && _loc5_._1811 != SymbolType.SHEET)
               {
                  _loc12_ = _loc8_;
                  _loc4_.push(new ExportImageFileByFrameIndex(_loc10_,_loc12_,param3.width,param3.height,param3.x,param3.y,_loc9_));
               }
               _loc4_.push(new _478(param1,param2));
            }
         }
         return _loc4_;
      }
      
      private function _3698(param1:Array) : Rectangle
      {
         var _loc2_:Object = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc3_:Point = new Point(int.MAX_VALUE,int.MAX_VALUE);
         var _loc4_:Point = new Point(int.MIN_VALUE,int.MIN_VALUE);
         var _loc7_:int = 0;
         var _loc8_:int = int(param1.length);
         while(_loc7_ < _loc8_)
         {
            _loc2_ = param1[_loc7_];
            _loc5_ = Number(_loc2_.povitX);
            _loc6_ = Number(_loc2_.povitY);
            if(_loc3_.x > _loc5_)
            {
               _loc3_.x = _loc5_;
            }
            if(_loc3_.y > _loc6_)
            {
               _loc3_.y = _loc6_;
            }
            if(_loc4_.x < _loc5_ + _loc2_.width)
            {
               _loc4_.x = _loc5_ + _loc2_.width;
            }
            if(_loc4_.y < _loc6_ + _loc2_.height)
            {
               _loc4_.y = _loc6_ + _loc2_.height;
            }
            _loc7_++;
         }
         return new Rectangle(-_loc3_.x,-_loc3_.y,_loc4_.x - _loc3_.x,_loc4_.y - _loc3_.y);
      }
      
      private function get _3443() : _596
      {
         return _1407.getInstance(_596) as _596;
      }
   }
}

