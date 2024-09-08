package _978
{
   import _13505._13504;
   import _13545._13548;
   import _1374.IconButton;
   import _636.TimelineEvent;
   import _822._829;
   import _822._842;
   import _834._838;
   import _965._964;
   import egret.utils.tr;
   import flash.events.MouseEvent;
   
   public class _980 extends Timeline
   {
      public var _6798:IconButton;
      
      public var _4590:IconButton;
      
      public var _4578:_829;
      
      public function _980()
      {
         super();
         this.skinName = _964;
         _6887 = new Vector.<_842>();
         _6850 = new Vector.<_842>();
      }
      
      override protected function _6604() : void
      {
         super._6604();
         this._6798.addEventListener(MouseEvent.CLICK,this._6927);
         this._4590.addEventListener(MouseEvent.CLICK,this._6926);
         this._4590.enabled = false;
         _4552._6033 = true;
         _4552._6031 = true;
         _4552._6011 = this._6925;
         _4552._4500 = this._4500;
         _4552._3576 = this._3576;
      }
      
      private function _6925(param1:Object) : Object
      {
         if(param1 is _13548 && (param1 as _13548)._1945 is _13504)
         {
            return param1;
         }
         return null;
      }
      
      private function _4500(param1:Array) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(param1.length);
         while(_loc2_ < _loc3_)
         {
            if(!(param1[_loc2_] is _13548 && (param1[_loc2_] as _13548)._1945 is _13504))
            {
               return false;
            }
            _loc2_++;
         }
         return true;
      }
      
      private function _3576(param1:Object, param2:Array) : Boolean
      {
         return false;
      }
      
      private function _6926(param1:MouseEvent) : void
      {
         dispatchEvent(new TimelineEvent(TimelineEvent.DEL_LAYER));
      }
      
      private function _6927(param1:MouseEvent) : void
      {
         dispatchEvent(new TimelineEvent(TimelineEvent.ADD_LAYER));
      }
      
      override protected function _2438() : void
      {
         super._2438();
      }
      
      override protected function _6846() : void
      {
         this._4578 = new _829();
         this._4578.skinName = _838;
         this._4578.data = {"icon":"/assets/timeline/timeline_autoTween"};
         this._4578.toolTip = tr("Timeline.basic.autoTween");
         _2513.addElement(_4635);
         _2513.addElement(_4605);
         _2513.addElement(_4667);
         _2513.addElement(_4663);
      }
      
      override public function dataChange() : void
      {
         super.dataChange();
         if(_6914 == null)
         {
            this._6798.enabled = false;
            this._4590.enabled = false;
         }
         else
         {
            this._6798.enabled = true;
         }
      }
   }
}

