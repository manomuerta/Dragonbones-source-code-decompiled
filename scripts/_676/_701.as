package _676
{
   import _1038._1037;
   import _40.TimelineVOBase;
   import _40._45;
   import _703._704;
   import _703._705;
   
   public class _701 extends _704
   {
      public var frames:_1037;
      
      private var _selected:Boolean;
      
      public var locked:Boolean;
      
      public function _701()
      {
         super();
      }
      
      public function get selected() : Boolean
      {
         return this._selected;
      }
      
      public function set selected(param1:Boolean) : void
      {
         if(this._selected == param1)
         {
            return;
         }
         this._selected = param1;
      }
      
      public function init() : void
      {
         var _loc2_:_45 = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         this.frames = new _1037();
         var _loc1_:Array = [];
         if(_3670._1816)
         {
            _loc3_ = 0;
            _loc4_ = int(_3670._1816.length);
            while(_loc3_ < _loc4_)
            {
               _loc2_ = _3670._1816[_loc3_];
               _loc1_.push(_690._3996(this.frames,_loc2_));
               _loc3_++;
            }
            this.frames.source = _loc1_;
         }
      }
      
      public function addFrame(param1:_45) : void
      {
         var _loc2_:_690 = null;
         _loc2_ = _705._3137[param1];
         if(_loc2_ == null)
         {
            _loc2_ = _690._3996(this.frames,param1);
         }
         else
         {
            _loc2_.parent = this.frames;
            _loc2_._1946 = param1;
            _loc2_.frameIndex = param1.startPos;
         }
         var _loc3_:int = TimelineVOBase(_3670).addKeyFrameAt(param1,param1.startPos);
         this.frames.addItemAt(_loc2_,_loc3_);
      }
      
      public function delFrame(param1:_45) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:_45 = null;
         var _loc4_:int = TimelineVOBase(_3670)._1943(param1);
         if(_loc4_ >= 0)
         {
            this.frames.removeItemAt(_loc4_);
         }
      }
      
      public function getFrameByIndex(param1:int) : _45
      {
         var _loc2_:_45 = null;
         var _loc3_:int = 0;
         var _loc4_:int = int(_3670._1816.length);
         while(_loc3_ < _loc4_)
         {
            _loc2_ = _3670._1816[_loc3_] as _45;
            if(_loc2_.startPos == param1)
            {
               return _loc2_;
            }
            _loc3_++;
         }
         return null;
      }
      
      public function moveFrame(param1:int, param2:int) : void
      {
         var _loc3_:_45 = TimelineVOBase(_3670).getFrameByIndex(param1);
         var _loc4_:_690 = _705._3137[_loc3_];
         TimelineVOBase(_3670).moveFrame(param1,param2);
         _loc4_.frameIndex = param2;
         this.frames.sortOn("frameIndex",Array.NUMERIC);
      }
      
      public function _3413(param1:Array, param2:int) : Array
      {
         var _loc4_:_45 = null;
         var _loc3_:Array = [];
         var _loc5_:int = 0;
         var _loc6_:int = int(param1.length);
         while(_loc5_ < _loc6_)
         {
            this.delFrame(param1[_loc5_]);
            param1[_loc5_].startPos += param2;
            _loc5_++;
         }
         _loc5_ = 0;
         _loc6_ = int(param1.length);
         while(_loc5_ < _loc6_)
         {
            _loc4_ = this.getFrameByIndex(param1[_loc5_].startPos);
            if(_loc4_)
            {
               _loc3_.push(_loc4_);
               this.delFrame(_loc4_);
            }
            _loc5_++;
         }
         _loc5_ = 0;
         _loc6_ = int(param1.length);
         while(_loc5_ < _loc6_)
         {
            this.addFrame(param1[_loc5_]);
            _loc5_++;
         }
         return _loc3_;
      }
      
      public function _5818(param1:Array) : Array
      {
         var _loc3_:_45 = null;
         var _loc4_:int = 0;
         var _loc5_:_45 = null;
         var _loc6_:int = 0;
         var _loc11_:_45 = null;
         var _loc12_:_45 = null;
         var _loc2_:Array = [];
         var _loc7_:Array = [];
         var _loc8_:Array = [];
         var _loc9_:int = 0;
         var _loc10_:int = int(param1.length);
         while(_loc9_ < _loc10_)
         {
            _loc5_ = param1[_loc9_].frame;
            _loc6_ = int(param1[_loc9_].moveTo);
            this.delFrame(_loc5_);
            _loc5_._1917 = _loc5_.startPos;
            _loc5_.startPos = _loc6_;
            _loc7_.push(_loc5_);
            _loc9_++;
         }
         _loc9_ = 0;
         _loc10_ = int(_loc7_.length);
         while(_loc9_ < _loc10_)
         {
            _loc3_ = this.getFrameByIndex(_loc7_[_loc9_].startPos);
            if(_loc3_)
            {
               _loc2_.push(_loc3_);
               this.delFrame(_loc3_);
            }
            _loc9_++;
         }
         _loc7_.sortOn("startPos",Array.NUMERIC);
         _loc9_ = 0;
         _loc10_ = int(_loc7_.length - 1);
         while(_loc9_ < _loc10_)
         {
            _loc11_ = _loc7_[_loc9_];
            _loc12_ = _loc7_[_loc9_ + 1];
            if(_loc12_.startPos == _loc11_.startPos)
            {
               _loc8_.push(_loc12_);
            }
            _loc9_++;
         }
         _loc9_ = 0;
         _loc10_ = int(_loc7_.length);
         while(_loc9_ < _loc10_)
         {
            _loc11_ = _loc7_[_loc9_];
            if(_loc8_.indexOf(_loc11_) == -1)
            {
               this.addFrame(_loc11_);
            }
            _loc9_++;
         }
         return _loc2_;
      }
   }
}

