package _12465
{
   import _11106._11105;
   import _11106._11108;
   import _11111._11110;
   import _12491._12492;
   import _12491._12493;
   import _12491._12494;
   import _12491._12495;
   import _12491._12496;
   import _12491._12497;
   import _12491._12498;
   import _12491._12499;
   import _12491._12912;
   import _12491._12913;
   import _1374.Alert;
   import _1404._1407;
   import _1529._1528;
   import _1529._1530;
   import _472._12461;
   import _636.PayEvent;
   import _648._12463;
   import _783._12475;
   import _93._94;
   import egret.utils.tr;
   import flash.events.Event;
   
   public class _12464 extends _94
   {
      public const BOTHER_TIME:int = 259200;
      
      private var _12715:Boolean = false;
      
      private var _12716:Boolean = false;
      
      private var _12719:Boolean = false;
      
      private var _13017:Boolean;
      
      private var _13014:String;
      
      private var _13015:int;
      
      private var _13005:Boolean = false;
      
      private var _12999:_12498;
      
      private var _12991:_12494;
      
      private var _12982:_12493;
      
      private var _13000:_12495;
      
      private var _13006:_12497;
      
      private var _12996:_12496;
      
      private var _12997:_12912;
      
      private var _12978:_12913;
      
      private var _13010:Function;
      
      private var _13018:_12467;
      
      public function _12464()
      {
         this.userModel = _1407.getInstance(_12463);
         this.cloudPayModel = _1407.getInstance(_12466);
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         this._13004._12680(this._12986);
      }
      
      override protected function _1576() : void
      {
         super._1576();
      }
      
      private function _12949(param1:_12475) : void
      {
         _1567(new _12475(_12475.CHECK_FUNCTION_LIMITED));
      }
      
      private function _12986(param1:Boolean, param2:Object) : void
      {
         if(param1)
         {
            this.cloudPayModel._2838(param2.data);
            this._12719 = true;
            this._12712();
         }
      }
      
      private function _3762(param1:_12475) : void
      {
         this._12716 = false;
         _1564(_12475.LOGIN,this._3762);
         this._12712();
      }
      
      private function _13001(param1:_12475) : void
      {
         this._12718();
      }
      
      public function _12505() : void
      {
         this._12715 = true;
         this._12712();
      }
      
      private function _12712() : void
      {
         if(!this._13005 && !this._12716 && this._12715 && this._12719)
         {
            this._13005 = true;
            this._12718();
            _1567(new _12475(_12475.CHECK_FUNCTION_LIMITED));
         }
      }
      
      private function _12718() : void
      {
      }
      
      private function _12710(param1:_12475) : void
      {
         this._13010 = param1.data;
         if(this._12719)
         {
            switch(this.cloudPayModel._13007())
            {
               case _12466.IN_PRESELL:
                  if(!this.userModel.paid)
                  {
                     if(!this.leaveMeAlone)
                     {
                        _11110.instance._11652(_11105.Name_OpenPayBriefWindow,_11108.CallPaidFunc);
                        this._12709();
                     }
                     else
                     {
                        this._13016();
                     }
                  }
                  else
                  {
                     this._13016();
                  }
                  break;
               case _12466.AFTER_PRESELL:
                  if(this.userModel.level == 0)
                  {
                     _12497._13012 = false;
                     _11110.instance._11652(_11105.Name_OpenPayMainWindow,_11108.CallPaidFunc);
                     new _12492(this._12711).open();
                  }
                  else
                  {
                     this._13016();
                  }
                  break;
               case _12466.BEFORE_PRESELL:
                  this._13016();
            }
         }
         else
         {
            this._13016();
         }
      }
      
      private function _12713(param1:Function = null) : void
      {
         _1567(new _12475(_12475.SHOW_LOGIN,param1));
      }
      
      private function _12714() : void
      {
      }
      
      private function _12708(param1:Function, param2:Function = null) : void
      {
         if(_2216.loginTip)
         {
            this._12991 = new _12494(param1,param2);
            this._12991.addEventListener(PayEvent.NEVER_TIP_LOGIN,this._13002);
            this._12991.addEventListener(Event.CLOSE,this._12992);
            this._12991.open();
         }
      }
      
      private function _12707(param1:Function = null) : void
      {
         if(_2216.loginTip)
         {
            this._12982 = new _12493(this._12713);
            this._12982.addEventListener(PayEvent.NEVER_TIP_LOGIN,this._13002);
            this._12982.addEventListener(Event.CLOSE,this._12983);
            this._12982.open();
         }
      }
      
      private function _13002(param1:PayEvent) : void
      {
         _2216.loginTip = false;
      }
      
      private function _12992(param1:Event) : void
      {
         this._12991.removeEventListener(PayEvent.NEVER_TIP_LOGIN,this._13002);
         this._12991.removeEventListener(Event.CLOSE,this._12992);
         this._12991 = null;
      }
      
      private function _12983(param1:Event) : void
      {
         this._12982.removeEventListener(PayEvent.NEVER_TIP_LOGIN,this._13002);
         this._12982.removeEventListener(Event.CLOSE,this._12983);
         this._12982 = null;
      }
      
      private function _12709(param1:_12499 = null) : void
      {
         if(this._13000)
         {
            this._13003(param1);
         }
         else
         {
            this._13000 = new _12495();
            this._13009(this._13000,this._12993,this._12976,this._12974,param1);
         }
      }
      
      private function _12993(param1:Event) : void
      {
         this._13000.removeEventListener(Event.CLOSE,this._12993);
         this._13000.removeEventListener("leftBtnClick",this._12976);
         this._13000.removeEventListener("rightBtnClick",this._12974);
         this._13000 = null;
      }
      
      private function _12976(param1:Event) : void
      {
         this.userModel.leaveMeAlone = this.cloudPayModel.curTime;
         this._13016();
         this._13000.close();
      }
      
      private function _12974(param1:Event) : void
      {
         this._13000.enabled = false;
         _12497._13012 = true;
         _11110.instance._11652(_11105.Name_OpenPayMainWindow,_11108.RightBtn);
         this._12711(this._13000);
      }
      
      private function _12711(param1:_12499 = null) : void
      {
      }
      
      private function _12987(param1:Event) : void
      {
         this._13006.removeEventListener(Event.CLOSE,this._12987);
         this._13006.removeEventListener("leftBtnClick",this._12977);
         this._13006.removeEventListener("rightBtnClick",this._12975);
         this._13006 = null;
      }
      
      private function _12977(param1:Event) : void
      {
         this._13006.enabled = false;
         _11110.instance._11652(_11105.Name_OpenPayBriefWindow,_11108.LeftBtn);
         this._12709(this._13006);
      }
      
      private function _12975(param1:Event) : void
      {
         var _loc2_:_12467 = this._13006.radioGroup._5568 as _12467;
         if(_loc2_)
         {
            this._13006.enabled = false;
            _11110.instance._11652(_11105.Name_OpenPayConfirmWindow,_11108.RightBtn);
            this._12988(_loc2_,this._13006);
         }
      }
      
      private function _12988(param1:_12467, param2:_12499) : void
      {
         this._13018 = param1;
         this._12996 = new _12496(this._13018);
         this._13009(this._12996,this._12980,this._12973,this._12972,param2);
      }
      
      private function _12980(param1:Event) : void
      {
         this._12996.removeEventListener(Event.CLOSE,this._12980);
         this._12996 = null;
      }
      
      private function _12973(param1:Event) : void
      {
         this._12996.enabled = false;
         _11110.instance._11652(_11105.Name_OpenPayMainWindow,_11108.LeftBtn);
         this._12711(this._12996);
      }
      
      private function _12972(param1:Event) : void
      {
         var _loc2_:int = 0;
         this._12996.enabled = false;
         if(_1528.language == _1530.zh_CN)
         {
            _loc2_ = this._12996.radioGroup._5568 == 0 ? _12461._12966 : _12461._12967;
         }
         else
         {
            _loc2_ = _12461._12965;
         }
         this.pay(this._13018.id,_loc2_);
      }
      
      private function _13009(param1:_12499, param2:Function, param3:Function, param4:Function, param5:_12499) : void
      {
         var payWindow:_12499 = param1;
         var onCloseFunc:Function = param2;
         var onLeftBtnClick:Function = param3;
         var onRightBtnClick:Function = param4;
         var _11695:_12499 = param5;
         payWindow.addEventListener(Event.CLOSE,onCloseFunc);
         payWindow.addEventListener("leftBtnClick",onLeftBtnClick);
         payWindow.addEventListener("rightBtnClick",onRightBtnClick);
         payWindow.addEventListener(Event.ACTIVATE,function(param1:Event):void
         {
            _13003(_11695);
         },false,0,true);
         payWindow.open();
      }
      
      private function _13003(param1:_12499) : void
      {
         if(param1)
         {
            param1.close();
         }
      }
      
      private function _12994(param1:int, param2:Object) : void
      {
         this._12999 = new _12498(param1,param2);
         this._12999.addEventListener(Event.CLOSE,this._12984);
         this._12999.open();
      }
      
      private function _12984(param1:Event) : void
      {
         if(this._12999)
         {
            this._12999.removeEventListener(Event.CLOSE,this._12984);
            this._12999 = null;
            this._13016();
         }
         if(this._12996)
         {
            this._12996.enabled = true;
         }
      }
      
      private function _12990() : void
      {
         this._12997 = new _12912();
         this._12997.addEventListener(Event.CLOSE,this._12995);
         this._12997.addEventListener(PayEvent.SHOW_ENTERPRISE,this._12981);
         this._12997.open();
      }
      
      private function _12981(param1:PayEvent) : void
      {
         this._12989();
      }
      
      private function _12995(param1:Event) : void
      {
         if(this._12997)
         {
            this._12997.removeEventListener(Event.CLOSE,this._12995);
            this._12997 = null;
         }
      }
      
      private function _12989() : void
      {
         this._12978 = new _12913();
         this._12978.addEventListener(Event.CLOSE,this._12979);
         this._12978.addEventListener(PayEvent.APPLY_ENTERPRISE,this._12985);
         this._12978.open();
      }
      
      private function _12985(param1:PayEvent) : void
      {
         var _loc2_:String = param1.data;
         if(_loc2_)
         {
            this._13004.setBusinessInfo(_loc2_,this.applySuccess);
         }
      }
      
      private function applySuccess() : void
      {
         if(this._12978)
         {
            this._12978.close();
         }
         Alert.show(tr("Pay.company.applySuccess"));
      }
      
      private function _12979(param1:Event) : void
      {
         if(this._12978)
         {
            this._12978.removeEventListener(Event.CLOSE,this._12979);
            this._12978.removeEventListener(PayEvent.APPLY_ENTERPRISE,this._12985);
            this._12978 = null;
         }
      }
      
      public function _13016() : void
      {
         this._13010 = null;
      }
      
      public function pay(param1:int, param2:int) : void
      {
         this._13015 = param2;
         this._13004.pay(param1,param2,this._13008);
      }
      
      private function _13008(param1:Boolean, param2:Object) : void
      {
         if(param1)
         {
            this._13017 = true;
            this._13014 = param2.data["order_num"];
            this._12994(this._13015,param2.data);
         }
         else if(param2.code == 114)
         {
            this._13013();
         }
         else
         {
            Alert.show(param2.msg);
            this._13016();
            if(this._12996)
            {
               this._12996.enabled = true;
            }
         }
      }
      
      public function _12998() : void
      {
         if(this._13017 && Boolean(this._13014))
         {
            this._13004._12683(this._13014,function(param1:Boolean, param2:Object):void
            {
               if(param1)
               {
                  if(int(param2.data["order_status"]) == 2)
                  {
                     _13013();
                  }
                  else if(_12999)
                  {
                     _12999._13011(_12498.STATUS_FAIL);
                  }
               }
               else
               {
                  if(_12999)
                  {
                     _12999._13011(_12498.STATUS_FAIL);
                  }
                  Alert.show(param2.msg);
               }
            });
         }
      }
      
      private function _13013() : void
      {
         _1567(new _12475(_12475.CHECK_FUNCTION_LIMITED));
         this._12990();
         this._13017 = false;
         this._13014 = null;
         if(this._13010 != null)
         {
            this._13010();
         }
         if(this._12999)
         {
            this._12999.close();
         }
         if(this._12996)
         {
            this._12996.close();
         }
         this._13004._9219(function():void
         {
            if(!userModel._3766)
            {
               Alert.show(tr("Alert.checkOnlineFailed"),"",null,function(param1:Event):void
               {
                  _1567(new _12475(_12475.SHOW_LOGIN));
               });
            }
         },false);
      }
      
      private function get _13004() : _12461
      {
         return _1407.getInstance(_12461) as _12461;
      }
      
      public function _12951() : Boolean
      {
         var _loc1_:int = 0;
         if(this._12719)
         {
            _loc1_ = int(this.cloudPayModel._13007());
            if(_loc1_ == _12466.AFTER_PRESELL)
            {
               if(!this.userModel._3766 || this.userModel.level <= 0)
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      private function get leaveMeAlone() : Boolean
      {
         return this.cloudPayModel.curTime - this.userModel.leaveMeAlone < this.BOTHER_TIME;
      }
   }
}

