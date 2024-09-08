package _472
{
   import _1404._1407;
   import _477.ExportController;
   import _586._596;
   import _6._5;
   import _625._627;
   
   public class _474 extends _5
   {
      private var _2210:_471;
      
      private var _3227:_627;
      
      private var _3602:ExportController;
      
      private var _3601:_596;
      
      public function _474()
      {
         this._2210 = _1407.getInstance(_471);
         this._3227 = _1407.getInstance(_627);
         this._3602 = _1407.getInstance(ExportController);
         this._3601 = _1407.getInstance(_596);
         super();
      }
      
      public function start() : void
      {
         this._2210.start();
         this._3227.start();
         this._3602.start();
      }
      
      public function _12505() : void
      {
         this._2210._12505();
      }
   }
}

