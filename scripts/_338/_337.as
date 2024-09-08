package _338
{
   import _1404._1407;
   import _51._52;
   import _51._79;
   import _555._571;
   import _573.TimelinePanelController;
   
   public class _337 extends _342
   {
      public function _337()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function execute() : void
      {
         this.update(this._3211);
      }
      
      override public function revert() : void
      {
         this.update(!this._3211);
      }
      
      private function update(param1:Boolean) : void
      {
         var _loc2_:Object = null;
         for each(_loc2_ in this._3210)
         {
            if(_loc2_ is _52 || _loc2_ is _79)
            {
               this._2880._3209(_loc2_,this.type,param1);
            }
         }
      }
      
      protected function get _2880() : _571
      {
         return _1407.getInstance(_571) as _571;
      }
      
      protected function get type() : String
      {
         return _2223.type;
      }
      
      protected function get _3210() : Array
      {
         return _2223._3210;
      }
      
      protected function get _3211() : Boolean
      {
         return _2223._3211;
      }
      
      protected function get _3208() : TimelinePanelController
      {
         return _1407.getInstance(TimelinePanelController) as TimelinePanelController;
      }
   }
}

