package _346
{
   import _1404._1407;
   import _477.ExportController;
   import _721._720;
   import _93._92;
   
   public class _351 extends _92
   {
      public function _351()
      {
         super();
      }
      
      override public function execute() : void
      {
         (_1407.getInstance(ExportController) as ExportController).startExport(this._3238);
      }
      
      private function get _3238() : _720
      {
         return _2223 as _720;
      }
   }
}

