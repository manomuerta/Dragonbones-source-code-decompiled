package _93
{
   import _1404._1407;
   import _14079._14082;
   import _18.IAction;
   import _472._471;
   import _521._522;
   import _521._525;
   import _579._580;
   import _586._603;
   import _6.Context;
   import _6._8;
   import _639._638;
   import _639._641;
   import _639._642;
   import avmplus.getQualifiedClassName;
   import flash.events.EventDispatcher;
   
   public class _92 extends EventDispatcher implements _8, IAction
   {
      private static var _context:Context = Context.getInstance();
      
      public var _2222:*;
      
      protected var _11208:String;
      
      protected var _11210:Boolean;
      
      protected var _2223:*;
      
      protected var _2208:*;
      
      protected var _2219:Boolean = false;
      
      protected var _2215:Boolean = false;
      
      protected var _2224:Boolean = false;
      
      protected var _2218:String;
      
      protected var _2221:String;
      
      public function _92()
      {
         super(null);
         this._11208 = getQualifiedClassName(this);
         this._11210 = false;
      }
      
      public function _1572(param1:*) : void
      {
         this._2223 = param1;
      }
      
      public function _1574() : void
      {
         this._2213();
         this._2217.addAction(this);
         this.execute();
         this.finish();
      }
      
      public function execute() : void
      {
      }
      
      public function revert() : void
      {
      }
      
      public function undo() : void
      {
         this.revert();
      }
      
      public function redo() : void
      {
         this.execute();
      }
      
      public function merge(param1:IAction) : Boolean
      {
         return false;
      }
      
      public function clearCache() : void
      {
      }
      
      public function _2213() : void
      {
         this._2208 = this._2211();
      }
      
      protected function _2211() : *
      {
         return null;
      }
      
      public function get _1799() : String
      {
         return this._11208;
      }
      
      public function get _11209() : Boolean
      {
         return this._11210;
      }
      
      public function finish() : void
      {
         this._11210 = true;
      }
      
      public function get _1637() : Boolean
      {
         return this._2219;
      }
      
      public function get _1631() : Boolean
      {
         return this._2215;
      }
      
      public function get _1642() : *
      {
         return this._2223;
      }
      
      public function set _1642(param1:*) : void
      {
         this._2223 = param1;
      }
      
      public function get _1634() : *
      {
         return this._2208;
      }
      
      public function set _1634(param1:*) : void
      {
         this._2208 = param1;
      }
      
      public function get _1639() : Boolean
      {
         return this._2224;
      }
      
      public function set _1639(param1:Boolean) : void
      {
         this._2224 = param1;
      }
      
      public function get _2214() : _638
      {
         return _context._1568.appModel as _638;
      }
      
      public function get _2220() : _641
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
         return _context._1568._2217;
      }
      
      protected function get _2209() : _522
      {
         return _context._1568._2209;
      }
      
      protected function get _2210() : _471
      {
         return _1407.getInstance(_471) as _471;
      }
      
      protected function get _2212() : _603
      {
         return (_1407.getInstance(_580) as _580)._2212;
      }
   }
}

