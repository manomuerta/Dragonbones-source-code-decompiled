package _127
{
   import _1374.TabGroup;
   import _1421._1422;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class _154 extends TabGroup
   {
      public function _154()
      {
         super();
         this.skinName = _155;
      }
      
      override protected function _2560(param1:MouseEvent) : void
      {
         _2561(selectedIndex);
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == _2515)
         {
            _2515.addEventListener(_1422.CLOSE,this._2559);
         }
      }
      
      protected function _2559(param1:Event) : void
      {
         _2561(selectedIndex);
      }
   }
}

