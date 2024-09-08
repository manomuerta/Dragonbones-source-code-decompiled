package _822
{
   import _1088._1092;
   import _1374.TextInput;
   import egret.core.ns_egret;
   import flash.events.Event;
   import flash.events.FocusEvent;
   
   use namespace ns_egret;
   
   public class _14093 extends _1092
   {
      public static const MINSCALE:int = 5;
      
      public static const MAXSCALE:int = 1000;
      
      public var _9727:String = "left";
      
      private var _9686:Number = 300;
      
      public var noFresh:Boolean = false;
      
      public var _14753:TextInput;
      
      private var _7623:Boolean = false;
      
      private var _7447:String = "";
      
      public function _14093()
      {
         super();
      }
      
      public function get _9687() : Number
      {
         return this._9686;
      }
      
      public function set _9687(param1:Number) : void
      {
         this._9686 = param1;
         if(_2490)
         {
            if(this._9686 == -1)
            {
               _2490.maxHeight = 10000;
            }
            else
            {
               _2490.maxHeight = this._9686;
            }
         }
      }
      
      public function get prompt() : String
      {
         return this._7447;
      }
      
      public function set prompt(param1:String) : void
      {
         if(this._7447 == param1)
         {
            return;
         }
         this._7447 = param1;
         this._7623 = true;
         _2466();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._14753.addEventListener(FocusEvent.FOCUS_OUT,this._14755);
      }
      
      private function _14755(param1:Event) : void
      {
         var _loc2_:int = int(this._14753.text.indexOf("%"));
         var _loc3_:Number = Number(this._14753.text);
         if(_loc2_ != -1)
         {
            _loc3_ = int(this._14753.text.substring(0,_loc2_));
         }
         if(isNaN(_loc3_) || _loc3_ < MINSCALE)
         {
            _loc3_ = MINSCALE;
         }
         if(_loc3_ > MAXSCALE)
         {
            _loc3_ = MAXSCALE;
         }
         this._14754(_loc3_);
      }
      
      override protected function _2476() : void
      {
         this._7447 = _2484;
         super._2476();
         if(this._7623)
         {
            this._7623 = false;
            this.ns_egret::_7430();
         }
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this._14753)
         {
            this._7623 = true;
            _2466();
         }
         if(param2 == _2490)
         {
            if(this._9686 == -1)
            {
               _2490.maxHeight = 10000;
            }
            else
            {
               _2490.maxHeight = this._9686;
            }
         }
      }
      
      override ns_egret function _7430(param1:* = undefined) : void
      {
         var _loc2_:int = 0;
         if(this._14753)
         {
            if(this.noFresh)
            {
               return;
            }
            if(param1 == undefined)
            {
               param1 = _2484;
            }
            if(param1 != null && param1 != undefined)
            {
               _loc2_ = int(param1.indexOf("%"));
               if(_loc2_ != -1)
               {
                  this._7447 = param1.substring(0,_loc2_);
               }
               else
               {
                  this._7447 = param1;
               }
               this._14753.text = this._7447 + "%";
            }
         }
      }
      
      public function _14754(param1:int, param2:Boolean = true) : void
      {
         var _loc3_:int = 0;
         this._7447 = param1.toString();
         if(this._14753)
         {
            this._14753.text = this._7447 + "%";
            _loc3_ = dataProvider.getItemIndex(this._14753.text);
            selectedIndex = _loc3_;
         }
         if(param2)
         {
            dispatchEvent(new Event(Event.CHANGE));
         }
      }
   }
}

