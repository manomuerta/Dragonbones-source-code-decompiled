package _346
{
   import _1404._1407;
   import _472._12461;
   import _477.ExportController;
   import _93._92;
   
   public class _372 extends _92
   {
      public function _372()
      {
         this._12569 = _1407.getInstance(_12461);
         super();
      }
      
      override public function execute() : void
      {
         var _3305:Function = null;
         _3305 = function():void
         {
            (_1407.getInstance(ExportController) as ExportController)._3305(_2223);
         };
         this._12569.callPaidFunction(1,_3305);
      }
   }
}

