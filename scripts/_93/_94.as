package _93
{
   import _1404._1407;
   import _14079._14082;
   import _51._50;
   import _521._525;
   import _521._532;
   import _521._535;
   import _6._7;
   import _639._638;
   import _639._641;
   import _639._642;
   
   public class _94 extends _7
   {
      protected var _2227:Boolean = false;
      
      protected var _2226:_532;
      
      protected var _2225:_535;
      
      public function _94()
      {
         this._2226 = _1407.getInstance(_532) as _532;
         this._2225 = _1407.getInstance(_535) as _535;
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         this._2227 = true;
      }
      
      override protected function dispose() : void
      {
         super.dispose();
         this._2227 = false;
      }
      
      protected function get _2214() : _638
      {
         return _1568.appModel as _638;
      }
      
      protected function get _2220() : _641
      {
         return this._2214._2220;
      }
      
      protected function get _2216() : _642
      {
         return this._2214._2216;
      }
      
      protected function get _14312() : _14082
      {
         return this._2214._14312;
      }
      
      protected function get _2217() : _525
      {
         return _1568._2217 as _525;
      }
      
      protected function get _3028() : _50
      {
         if(this._2214 && this._2214._1844 && this._2214._1844._2871 && Boolean(this._2214._1844._2871._2865))
         {
            return this._2214._1844._2871._2865;
         }
         return null;
      }
   }
}

