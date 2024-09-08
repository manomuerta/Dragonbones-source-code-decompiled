package _388
{
   import _1404._1407;
   import _51._52;
   import _51._70;
   import _51._79;
   import _521._532;
   import _93._92;
   
   public class _387 extends _92
   {
      public function _387()
      {
         super();
         _2219 = true;
         _2215 = false;
      }
      
      override public function _1574() : void
      {
         if(_2223 is _52 && !this._2226._3316 || (_2223 is _79 || _2223 is _70) && !this._2226._3315)
         {
            return;
         }
         this.execute();
         finish();
         _2217.addAction(this);
      }
      
      override public function execute() : void
      {
         this._2226._3314(_2223);
      }
      
      override protected function _2211() : *
      {
         return this._2226._2484;
      }
      
      private function get _2226() : _532
      {
         return _1407.getInstance(_532);
      }
   }
}

