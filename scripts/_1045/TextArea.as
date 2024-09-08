package _1045
{
   import _1088._1099;
   import egret.core.ns_egret;
   import flash.events.Event;
   
   use namespace ns_egret;
   
   public class TextArea extends _1099
   {
      private var _8560:Boolean = false;
      
      private var _8289:String;
      
      private var _8561:Boolean = false;
      
      private var _8290:String;
      
      public var _2491:Scroller;
      
      public function TextArea()
      {
         super();
      }
      
      public function get _6245() : Number
      {
         return ns_egret::_8515();
      }
      
      public function set _6245(param1:Number) : void
      {
         ns_egret::_8516(param1);
      }
      
      public function get _6244() : Number
      {
         return ns_egret::_8513();
      }
      
      public function set _6244(param1:Number) : void
      {
         ns_egret::_8514(param1);
      }
      
      public function _7653(param1:int = 0, param2:int = 2147483647) : void
      {
         if(_2577)
         {
            _2577._7653(param1,param2);
         }
      }
      
      public function get _6052() : String
      {
         return this._8289;
      }
      
      public function set _6052(param1:String) : void
      {
         if(this._8289 == param1)
         {
            return;
         }
         this._8289 = param1;
         this._8560 = true;
         _2466();
      }
      
      public function get _6182() : String
      {
         return this._8290;
      }
      
      public function set _6182(param1:String) : void
      {
         if(this._8290 == param1)
         {
            return;
         }
         this._8290 = param1;
         this._8561 = true;
         _2466();
      }
      
      override public function set text(param1:String) : void
      {
         super.text = param1;
         dispatchEvent(new Event("textChanged"));
      }
      
      override protected function _2476() : void
      {
         super._2476();
         if(this._8560)
         {
            if(this._2491)
            {
               this._2491._6052 = this._6052;
            }
            this._8560 = false;
         }
         if(this._8561)
         {
            if(this._2491)
            {
               this._2491._6182 = this._6182;
            }
            this._8561 = false;
         }
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == _2577)
         {
            _2577.multiline = true;
         }
         else if(param2 == this._2491)
         {
            if(this._2491._8292)
            {
               this._2491._8292._8236 = 0;
            }
            if(this._2491._8294)
            {
               this._2491._8294._8236 = 0;
            }
         }
      }
   }
}

