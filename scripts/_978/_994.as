package _978
{
   import _1045.HSlider;
   import _1177.UIEvent;
   import _636.TimelineEvent;
   import _965._974;
   import flash.events.MouseEvent;
   
   public class _994 extends HSlider
   {
      private var _6998:Boolean;
      
      public function _994()
      {
         super();
         this.skinName = _974;
         addEventListener(UIEvent.CREATION_COMPLETE,this._6447);
      }
      
      private function _6447(param1:UIEvent) : void
      {
         removeEventListener(UIEvent.CREATION_COMPLETE,this._6447);
         track.enabled = false;
         track.mouseEnabled = false;
         track.mouseChildren = false;
         _2557.addEventListener(MouseEvent.CLICK,this._6997);
         this._6998 = true;
      }
      
      public function setData(param1:Number, param2:Number, param3:Number) : void
      {
         this.visible = param1 > param2;
         this.maximum = param1 - param2;
         this.minimum = 0;
         this.value = param3;
         if(this._6998)
         {
            if(value > 0 && !visible)
            {
               this.visible = true;
               _2557.width = this.width;
            }
            else
            {
               _2557.width = this.width * param2 / param1;
               track.width = this.width;
            }
         }
      }
      
      private function _6997(param1:MouseEvent) : void
      {
         if(maximum <= 0)
         {
            dispatchEvent(new TimelineEvent(TimelineEvent.GOTO_FIRST_FRAME));
         }
      }
   }
}

