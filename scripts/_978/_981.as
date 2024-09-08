package _978
{
   import _13505._13504;
   import _13545._13548;
   import _51._50;
   import _51._52;
   import _51._79;
   import _521._532;
   import _521._535;
   import _636.TimelineEvent;
   import flash.events.MouseEvent;
   
   public class _981 extends _982
   {
      public const ICON_LAYER:String = "/assets/panelIcon/layer.png";
      
      public function _981()
      {
         super();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         _6928.doubleClickEnabled = true;
         _6928.addEventListener(MouseEvent.DOUBLE_CLICK,this._4004);
      }
      
      private function _4004(param1:MouseEvent) : void
      {
         var _loc3_:_13504 = null;
         var _loc4_:_52 = null;
         var _loc2_:_13548 = data as _13548;
         if(_loc2_)
         {
            _loc3_ = _loc2_._1945 as _13504;
            if(_loc3_)
            {
               _loc4_ = _loc3_._1823;
               dispatchEvent(new TimelineEvent(TimelineEvent.CHANGE_LAYER_NAME,_loc4_,true));
            }
         }
      }
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         _6928.opened = false;
         _6928._2615.visible = false;
         if(_data is _13548)
         {
            _6928._5988 = this.ICON_LAYER;
         }
      }
      
      override public function _6845() : void
      {
         var _loc1_:_79 = null;
         if(_3670)
         {
            if(!(_3670 is _50))
            {
               if(_3670 is _52)
               {
                  _loc1_ = (_3670 as _52)._1882;
               }
               else if(_3670 is _79)
               {
                  _loc1_ = _3670 as _79;
               }
               if(_loc1_)
               {
                  data.visible = _535.instance._3371(_loc1_);
                  data.locked = _532.instance._3367(_loc1_,true);
               }
            }
            _6943.selected = data.visible;
            _6941.selected = data.locked;
         }
      }
   }
}

