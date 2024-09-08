package egret.managers
{
   import _1177.UIEvent;
   import _1215._1214;
   import egret.core._1141;
   import egret.core.ns_egret;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.UncaughtErrorEvent;
   
   use namespace ns_egret;
   
   public class _1216 extends EventDispatcher
   {
      private var _9029:int = 2147483647;
      
      private var _9026:_1214;
      
      private var _7680:Boolean = false;
      
      private var _9019:Boolean = false;
      
      private var _9022:_1214;
      
      private var _7701:Boolean = false;
      
      private var _9023:Boolean = false;
      
      private var _9025:_1214;
      
      private var _7674:Boolean = false;
      
      private var _9021:_1214;
      
      private var _9027:Boolean = false;
      
      public function _1216()
      {
         this._9026 = new _1214();
         this._9022 = new _1214();
         this._9025 = new _1214();
         this._9021 = new _1214();
         super();
      }
      
      public function _2466(param1:_1205) : void
      {
         if(!this._7680)
         {
            this._7680 = true;
            if(!this._9027)
            {
               this._9028();
            }
         }
         if(this._9029 <= param1._7569)
         {
            this._9019 = true;
         }
         this._9022.insert(param1);
      }
      
      private function _6040() : void
      {
         var _loc1_:_1205 = this._9022.shift();
         while(_loc1_)
         {
            if(_loc1_.parent)
            {
               _loc1_._6040();
               if(!_loc1_._8665)
               {
                  this._9026.insert(_loc1_);
                  _loc1_._8665 = true;
               }
            }
            _loc1_ = this._9022.shift();
         }
         if(this._9022.isEmpty())
         {
            this._7680 = false;
         }
      }
      
      public function invalidateSize(param1:_1205) : void
      {
         if(!this._7701)
         {
            this._7701 = true;
            if(!this._9027)
            {
               this._9028();
            }
         }
         if(this._9029 <= param1._7569)
         {
            this._9023 = true;
         }
         this._9025.insert(param1);
      }
      
      private function _8079() : void
      {
         var _loc1_:_1205 = this._9025.pop();
         while(_loc1_)
         {
            if(_loc1_.parent)
            {
               _loc1_._8079();
               if(!_loc1_._8665)
               {
                  this._9026.insert(_loc1_);
                  _loc1_._8665 = true;
               }
            }
            _loc1_ = this._9025.pop();
         }
         if(this._9025.isEmpty())
         {
            this._7701 = false;
         }
      }
      
      public function invalidateDisplayList(param1:_1205) : void
      {
         if(!this._7674)
         {
            this._7674 = true;
            if(!this._9027)
            {
               this._9028();
            }
         }
         this._9021.insert(param1);
      }
      
      private function _6929() : void
      {
         var _loc1_:_1205 = this._9021.shift();
         while(_loc1_)
         {
            if(_loc1_.parent)
            {
               _loc1_._6929();
               if(!_loc1_._8665)
               {
                  this._9026.insert(_loc1_);
                  _loc1_._8665 = true;
               }
            }
            _loc1_ = this._9021.shift();
         }
         if(this._9021.isEmpty())
         {
            this._7674 = false;
         }
      }
      
      private function _9028() : void
      {
         _1141.ns_egret::stage.addEventListener(Event.ENTER_FRAME,this._9020);
         _1141.ns_egret::stage.addEventListener(Event.RENDER,this._9020);
         _1141.ns_egret::stage.invalidate();
         this._9027 = true;
      }
      
      private function _9020(param1:Event = null) : void
      {
         var errorEvent:UncaughtErrorEvent = null;
         var event:Event = param1;
         _1141.ns_egret::stage.removeEventListener(Event.ENTER_FRAME,this._9020);
         _1141.ns_egret::stage.removeEventListener(Event.RENDER,this._9020);
         if(_1141._8707)
         {
            try
            {
               this._9024();
            }
            catch(e:Error)
            {
               errorEvent = new UncaughtErrorEvent("callLaterError",false,true,e.getStackTrace());
               _1141.ns_egret::stage.dispatchEvent(errorEvent);
            }
         }
         else
         {
            this._9024();
         }
      }
      
      private function _9024() : void
      {
         var _loc1_:_1205 = null;
         if(this._7680)
         {
            this._6040();
         }
         if(this._7701)
         {
            this._8079();
         }
         if(this._7674)
         {
            this._6929();
         }
         if(this._7680 || this._7701 || this._7674)
         {
            this._9028();
         }
         else
         {
            this._9027 = false;
            _loc1_ = this._9026.pop();
            while(_loc1_)
            {
               if(!_loc1_.initialized)
               {
                  _loc1_.initialized = true;
               }
               if(_loc1_.hasEventListener(UIEvent.UPDATE_COMPLETE))
               {
                  _loc1_.dispatchEvent(new UIEvent(UIEvent.UPDATE_COMPLETE));
               }
               _loc1_._8665 = false;
               _loc1_ = this._9026.pop();
            }
            dispatchEvent(new UIEvent(UIEvent.UPDATE_COMPLETE));
         }
      }
      
      public function _2449() : void
      {
         var _loc1_:int = 0;
         while(this._9027 && _loc1_++ < 100)
         {
            this._9020();
         }
      }
      
      public function _1608(param1:_1205, param2:Boolean = false) : void
      {
         var _loc3_:_1205 = null;
         var _loc4_:int = 0;
         var _loc5_:Boolean = false;
         var _loc6_:int = this._9029;
         if(this._9029 == int.MAX_VALUE)
         {
            this._9029 = param1._7569;
         }
         while(!_loc5_)
         {
            _loc5_ = true;
            _loc3_ = _1205(this._9022._9014(param1));
            while(_loc3_)
            {
               if(_loc3_.parent)
               {
                  _loc3_._6040();
                  if(!_loc3_._8665)
                  {
                     this._9026.insert(_loc3_);
                     _loc3_._8665 = true;
                  }
               }
               _loc3_ = _1205(this._9022._9014(param1));
            }
            if(this._9022.isEmpty())
            {
               this._7680 = false;
            }
            this._9019 = false;
            _loc3_ = _1205(this._9025._9015(param1));
            while(_loc3_)
            {
               if(_loc3_.parent)
               {
                  _loc3_._8079();
                  if(!_loc3_._8665)
                  {
                     this._9026.insert(_loc3_);
                     _loc3_._8665 = true;
                  }
               }
               if(this._9019)
               {
                  _loc3_ = _1205(this._9022._9014(param1));
                  if(_loc3_)
                  {
                     this._9022.insert(_loc3_);
                     _loc5_ = false;
                     break;
                  }
               }
               _loc3_ = _1205(this._9025._9015(param1));
            }
            if(this._9025.isEmpty())
            {
               this._7701 = false;
            }
            this._9019 = false;
            this._9023 = false;
            if(!param2)
            {
               _loc3_ = _1205(this._9021._9014(param1));
               while(_loc3_)
               {
                  if(_loc3_.parent)
                  {
                     _loc3_._6929();
                     if(!_loc3_._8665)
                     {
                        this._9026.insert(_loc3_);
                        _loc3_._8665 = true;
                     }
                  }
                  if(this._9019)
                  {
                     _loc3_ = _1205(this._9022._9014(param1));
                     if(_loc3_)
                     {
                        this._9022.insert(_loc3_);
                        _loc5_ = false;
                        break;
                     }
                  }
                  if(this._9023)
                  {
                     _loc3_ = _1205(this._9025._9015(param1));
                     if(_loc3_)
                     {
                        this._9025.insert(_loc3_);
                        _loc5_ = false;
                        break;
                     }
                  }
                  _loc3_ = _1205(this._9021._9014(param1));
               }
               if(this._9021.isEmpty())
               {
                  this._7674 = false;
               }
            }
         }
         if(_loc6_ == int.MAX_VALUE)
         {
            this._9029 = int.MAX_VALUE;
            if(!param2)
            {
               _loc3_ = _1205(this._9026._9015(param1));
               while(_loc3_)
               {
                  if(!_loc3_.initialized)
                  {
                     _loc3_.initialized = true;
                  }
                  if(_loc3_.hasEventListener(UIEvent.UPDATE_COMPLETE))
                  {
                     _loc3_.dispatchEvent(new UIEvent(UIEvent.UPDATE_COMPLETE));
                  }
                  _loc3_._8665 = false;
                  _loc3_ = _1205(this._9026._9015(param1));
               }
            }
         }
      }
   }
}

