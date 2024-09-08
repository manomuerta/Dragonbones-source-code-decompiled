package _477
{
   import _120._121;
   import _120._123;
   import _609.HandleBackgroundColorTask;
   import _609.HandleSquareTask;
   import _609._611;
   import _609._612;
   import _609._613;
   import _609._618;
   
   public class _507 extends _494
   {
      public function _507()
      {
         super();
      }
      
      override public function run() : void
      {
         var _loc1_:_123 = new _123();
         _loc1_._2389(new _611());
         _loc1_._2389(new _612());
         _loc1_._2389(new _618());
         _loc1_._2389(new _613());
         _loc1_._2389(new HandleSquareTask());
         _loc1_._2389(new HandleBackgroundColorTask());
         _loc1_.addEventListener(_121.COMPLETE,this._3702);
         _loc1_.addEventListener(_121.FAIL,this._3703);
         _loc1_.run();
      }
      
      private function _3703(param1:_121) : void
      {
         fail(param1.data.type,param1.data.data);
      }
      
      private function _3702(param1:_121) : void
      {
         complete();
      }
   }
}

