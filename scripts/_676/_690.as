package _676
{
   import _1038._1037;
   import _40._45;
   import _636.TimelineEvent;
   import _703._705;
   
   public class _690
   {
      public var frames:Vector.<_690>;
      
      public var _1707:Boolean;
      
      public var _1946:_45;
      
      private var _3684:int;
      
      private var _selected:Boolean;
      
      public var parent:_1037;
      
      public var _3409:Boolean;
      
      public function _690()
      {
         super();
      }
      
      public static function _3996(param1:_1037, param2:_45) : _690
      {
         var _loc3_:_690 = new _690();
         _loc3_.parent = param1;
         _loc3_._1946 = param2;
         _loc3_.frameIndex = param2.startPos;
         _705._3137[param2] = _loc3_;
         return _loc3_;
      }
      
      public function get frameNum() : int
      {
         if(this.frames)
         {
            return this.frames.length;
         }
         return 0;
      }
      
      public function get selected() : Boolean
      {
         return this._selected;
      }
      
      public function set selected(param1:Boolean) : void
      {
         if(this._selected != param1)
         {
            this._selected = param1;
            if(this.parent)
            {
               this.parent.dispatchEvent(new TimelineEvent(TimelineEvent.UPDATE));
               this.parent._4016(this);
            }
         }
      }
      
      public function get frameIndex() : int
      {
         return this._3684;
      }
      
      public function set frameIndex(param1:int) : void
      {
         this._3684 = param1;
         if(this.parent)
         {
            this.parent.dispatchEvent(new TimelineEvent(TimelineEvent.UPDATE));
            this.parent._4016(this);
         }
      }
      
      public function clone() : _690
      {
         var _loc1_:_690 = new _690();
         _loc1_._1946 = this._1946;
         _loc1_.frameIndex = this.frameIndex;
         _loc1_.selected = this.selected;
         return _loc1_;
      }
      
      public function dataChange() : void
      {
         if(this.parent)
         {
            this.parent.dispatchEvent(new TimelineEvent(TimelineEvent.UPDATE));
            this.parent._4016(this);
         }
      }
   }
}

