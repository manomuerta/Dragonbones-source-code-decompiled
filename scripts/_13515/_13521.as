package _13515
{
   import _13492._13496;
   import _13505._13510;
   import _1404._1407;
   import _573.TimelinePanelController;
   import _93._92;
   
   public class _13521 extends _92
   {
      public function _13521()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function execute() : void
      {
         this._1945._4589(this._1946);
         if(this._1945._1816.length == 1)
         {
            this._2894();
         }
      }
      
      override public function revert() : void
      {
         this._1945._1943(this._1946);
         if(this._1945._1816.length == 0)
         {
            this._2894();
         }
      }
      
      private function get _1945() : _13510
      {
         return _2223._1945;
      }
      
      private function get _1946() : _13496
      {
         return _2223._1946;
      }
      
      private function _2894() : void
      {
         this._2852._2891();
      }
      
      protected function get _2852() : TimelinePanelController
      {
         return _1407.getInstance(TimelinePanelController) as TimelinePanelController;
      }
   }
}

