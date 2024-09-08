package _978
{
   import _1045.Group;
   import _1045._1069;
   import _1045._1072;
   import _13545._13547;
   import _13545._13548;
   import _636.TimelineEvent;
   import _97._100;
   import egret.core._1140;
   import flash.events.Event;
   
   public class _983 extends Group implements _1072, _1069
   {
      private const CURVE_GAP:int = 14;
      
      private const HALF_GAP:int = 7;
      
      private const CURVE_HEIGHT:int = 6;
      
      private var _6931:Object;
      
      private var _6942:int;
      
      private var _6932:Boolean;
      
      private var _6620:Boolean;
      
      private var _selected:Boolean;
      
      private var _2540:int;
      
      private var _2541:String;
      
      private var _data:Object;
      
      private var _frames:Vector.<_13547>;
      
      private var _6948:int;
      
      private var _2736:_1140;
      
      public function _983()
      {
         this._2736 = new _1140();
         super();
         this._frames = new Vector.<_13547>();
         this._6948 = Timeline.FRAME_HEIGHT * 0.5 - 1;
         this.height = Timeline.FRAME_HEIGHT;
         addElement(this._2736);
      }
      
      public function get data() : Object
      {
         return this._data;
      }
      
      public function set data(param1:Object) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         this._data = param1;
         this._frames.length = 0;
         var _loc4_:_13548 = this._data as _13548;
         if(_loc4_)
         {
            _loc2_ = 0;
            _loc3_ = _loc4_.frames.length;
            while(_loc2_ < _loc3_)
            {
               this._frames.push(_loc4_.frames.getItemAt(_loc2_) as _13547);
               _loc2_++;
            }
            if(!_loc4_.frames.hasEventListener(TimelineEvent.UPDATE))
            {
               _loc4_.frames.addEventListener(TimelineEvent.UPDATE,this.onUpdate);
            }
         }
         this._6947();
      }
      
      private function onUpdate(param1:Event) : void
      {
         this._6947();
      }
      
      private function _6944(param1:_13547, param2:_13547) : int
      {
         return param1.frameIndex < param2.frameIndex ? -1 : 1;
      }
      
      private function _6947() : void
      {
         var _loc1_:_13547 = null;
         var _loc2_:_13547 = null;
         this._frames.sort(this._6944);
         this._2736.graphics.clear();
         var _loc3_:int = 0;
         var _loc4_:int = int(this._frames.length - 1);
         while(_loc3_ < _loc4_)
         {
            _loc1_ = this._frames[_loc3_];
            _loc2_ = this._frames[_loc3_ + 1];
            if(Boolean(_loc1_) && Boolean(_loc2_))
            {
               if(_loc1_.tweenEnabled)
               {
                  if(_loc1_._11515)
                  {
                     this._6946(_loc1_,_loc2_);
                  }
                  else if(_loc1_._13642)
                  {
                     this._6107(_loc1_,_loc2_);
                  }
               }
            }
            _loc3_++;
         }
      }
      
      public function refresh() : void
      {
         this.data = this._data;
      }
      
      private function _6107(param1:_13547, param2:_13547) : void
      {
         if(param1.selected)
         {
            this._2736.graphics.lineStyle(1,_100.CURVE_SELECTED_COLOR);
         }
         else
         {
            this._2736.graphics.lineStyle(1,_100.CURVE_COLOR);
         }
         this._2736.graphics.moveTo(this._6945(param1),this._6948);
         this._2736.graphics.lineTo(this._6945(param2),this._6948);
      }
      
      private function _6946(param1:_13547, param2:_13547) : void
      {
         if(param1.selected)
         {
            this._2736.graphics.lineStyle(1,_100.CURVE_SELECTED_COLOR);
         }
         else
         {
            this._2736.graphics.lineStyle(1,_100.CURVE_COLOR);
         }
         var _loc3_:Number = this._6945(param1);
         var _loc4_:Number = this._6945(param2);
         if(_loc4_ - _loc3_ > this.CURVE_GAP)
         {
            this._2736.graphics.moveTo(_loc3_,this._6948 + this.CURVE_HEIGHT);
            this._2736.graphics.lineTo(_loc3_ + this.HALF_GAP,this._6948);
            this._2736.graphics.lineTo(_loc4_ - this.HALF_GAP,this._6948);
            this._2736.graphics.lineTo(_loc4_,this._6948 - this.CURVE_HEIGHT);
         }
         else
         {
            this._2736.graphics.moveTo(this._6945(param1),this._6948 + this.CURVE_HEIGHT);
            this._2736.graphics.lineTo(this._6945(param2),this._6948 - this.CURVE_HEIGHT);
         }
      }
      
      private function _6945(param1:_13547) : int
      {
         var _loc2_:int = Timeline._6923;
         var _loc3_:int = Timeline._6908;
         return _loc2_ / _loc3_ * param1.frameIndex - _loc2_ * Timeline.index / Timeline._6908;
      }
      
      public function get _5988() : Object
      {
         return this._6931;
      }
      
      public function set _5988(param1:Object) : void
      {
         this._6931 = param1;
      }
      
      public function get depth() : int
      {
         return this._6942;
      }
      
      public function set depth(param1:int) : void
      {
         this._6942 = param1;
      }
      
      public function get _4521() : Boolean
      {
         return this._6932;
      }
      
      public function set _4521(param1:Boolean) : void
      {
         this._6932 = param1;
      }
      
      public function get opened() : Boolean
      {
         return this._6620;
      }
      
      public function set opened(param1:Boolean) : void
      {
         this._6620 = param1;
      }
      
      public function get selected() : Boolean
      {
         return this._selected;
      }
      
      public function set selected(param1:Boolean) : void
      {
         this._selected = param1;
      }
      
      public function get itemIndex() : int
      {
         return this._2540;
      }
      
      public function set itemIndex(param1:int) : void
      {
         this._2540 = param1;
      }
      
      public function get label() : String
      {
         return this._2541;
      }
      
      public function set label(param1:String) : void
      {
         this._2541 = param1;
      }
   }
}

