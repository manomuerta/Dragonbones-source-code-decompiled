package _477
{
   import _120._119;
   import _120._121;
   import _120._122;
   import _1404._1407;
   import _586._596;
   import egret.utils.FileUtil;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class _11101 extends _494
   {
      private var _3605:String;
      
      private var _3607:String;
      
      private var _3684:int;
      
      public function _11101(param1:String, param2:String, param3:int)
      {
         super();
         this._3607 = param1;
         this._3605 = param2;
         this._3684 = param3;
      }
      
      override public function run() : void
      {
         var _loc1_:Array = null;
         var _loc2_:Vector.<_119> = null;
         var _loc3_:Rectangle = null;
         var _loc5_:int = 0;
         var _loc4_:int = 0;
         var _loc6_:String = _3238.ouputPath + _3238.outputFolder;
         _3613.ouputPath = FileUtil.escapePath(_loc6_);
         _loc1_ = this._3695(this._3607,this._3605);
         _loc3_ = this._3698(_loc1_);
         var _loc7_:_122 = new _122();
         var _loc8_:String = this._3607;
         if(this._3605 != null)
         {
            _loc8_ += "_" + this._3605;
         }
         var _loc9_:ExportImageFileByFrameIndex = new ExportImageFileByFrameIndex(this._3684,this._3684,_loc3_.width,_loc3_.height,_loc3_.x,_loc3_.y,_loc8_);
         _loc7_._2389(_loc9_);
         _loc7_.addEventListener(_121.COMPLETE,this._3700);
         _loc7_.addEventListener(_121.FAIL,this._3700);
         _loc7_.addEventListener(_121.PROGRESS,this._3697);
         _loc7_.run();
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
         var _loc3_:Array = [];
         var _loc4_:Object = this._3443._3696(this._3684);
         _loc3_.push(_loc4_);
         return _loc3_;
      }
      
      private function _3698(param1:Array) : Rectangle
      {
         var _loc2_:Object = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc3_:Point = new Point(int.MAX_VALUE,int.MAX_VALUE);
         var _loc4_:Point = new Point(int.MIN_VALUE,int.MIN_VALUE);
         if(param1 == null)
         {
            return new Rectangle(0,0,1,1);
         }
         var _loc7_:int = 0;
         var _loc8_:int = int(param1.length);
         while(_loc7_ < _loc8_)
         {
            _loc2_ = param1[_loc7_];
            if(_loc2_)
            {
               _loc5_ = Number(_loc2_.povitX);
               _loc6_ = Number(_loc2_.povitY);
               if(isNaN(_loc5_))
               {
                  _loc5_ = 0;
               }
               if(isNaN(_loc6_))
               {
                  _loc6_ = 0;
               }
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

