package _1009
{
   import _1045.Button;
   import _1045.Group;
   import _1045.Label;
   import _1045._1105;
   import _1177.CloseEvent;
   import _1185._1189;
   import _127._171;
   import _1374.Alert;
   import _1404._1407;
   import _472._12461;
   import _648._12463;
   import _783._12475;
   import _97._125;
   import egret.utils.tr;
   import flash.display.NativeWindowType;
   import flash.events.MouseEvent;
   
   public class LoginLimitedWindow extends _171
   {
      private static var _12837:Class = LoginLimitedWindow__12837;
      
      private var _12838:String;
      
      private var _password:String;
      
      public function LoginLimitedWindow(param1:String, param2:String)
      {
         this._12594 = _1407.getInstance(_12463);
         this._12569 = _1407.getInstance(_12461);
         super();
         this.width = 550;
         this.title = tr("LoginLimitedWindow.title");
         this.maximizable = false;
         this.minimizable = false;
         this.resizable = false;
         this.type = NativeWindowType.UTILITY;
         this._12838 = param1;
         this._password = param2;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         _2512.top = _2512.bottom = 10;
         _2512.left = _2512.right = 15;
         var _loc1_:Group = _125._2414(15);
         _loc1_.percentWidth = 100;
         (_loc1_.layout as _1189)._2410 = 10;
         _loc1_.addElement(new _1105(_12837));
         _loc1_.addElement(this._12836(tr("LoginLimitedWindow.warning")));
         _2512.addElement(_loc1_);
         _2512.addElement(this._12836(tr("LoginLimitedWindow.provideOption")));
         this._12765("A",tr("LoginLimitedWindow.optionAText"),tr("LoginLimitedWindow.showTutorial"),this._12832);
         this._12765("B",tr("LoginLimitedWindow.optionBText"),tr("LoginLimitedWindow.forceLogin"),this._12833);
         this._12765("C",tr("LoginLimitedWindow.optionCText"),tr("LoginLimitedWindow.resetPassword"),this._12831);
         var _loc2_:Group = _125._12511();
         var _loc3_:Button = _125._12513(tr("LoginLimitedWindow.ignore"));
         _loc3_.addEventListener(MouseEvent.CLICK,this._12834);
         _loc2_.addElement(_loc3_);
         _2512.addElement(_loc2_);
      }
      
      private function _12765(param1:String, param2:String, param3:String, param4:Function) : void
      {
         var _loc5_:Group;
         (_loc5_ = _125._2414(10)).percentWidth = 100;
         _loc5_.addElement(this._12835(param1));
         _loc5_.addElement(this._12836(param2));
         var _loc6_:Button;
         (_loc6_ = new Button()).width = 92;
         _loc6_.label = param3;
         _loc6_.addEventListener(MouseEvent.CLICK,param4);
         _loc5_.addElement(_loc6_);
         _2512.addElement(_loc5_);
      }
      
      private function _12836(param1:String) : Label
      {
         var _loc2_:Label = new Label();
         _loc2_.percentWidth = 100;
         _loc2_.text = param1;
         return _loc2_;
      }
      
      private function _12835(param1:String) : Label
      {
         var _loc2_:Label = new Label();
         _loc2_.text = tr("LoginLimitedWindow.option",param1);
         return _loc2_;
      }
      
      private function _12832(param1:MouseEvent) : void
      {
         new _12906().open();
      }
      
      private function _12833(param1:MouseEvent) : void
      {
         var event:MouseEvent = param1;
         Alert.show(tr("Alert.forceLoginConfirm"),"",null,function(param1:CloseEvent):void
         {
            var e:CloseEvent = param1;
            if(e.detail === Alert.FIRST_BUTTON)
            {
               _12569.login(_12838,_password,2,function(param1:Boolean, param2:Object):void
               {
                  if(_12594._3766)
                  {
                     close();
                     Alert.show(tr("Alert.operateSuccessful"),"");
                  }
                  else
                  {
                     switch(param2.code)
                     {
                        case _12461.ForceLoginLimit:
                           Alert.show(tr("Alert.forceLoginLimit"),"");
                     }
                  }
               });
            }
         },tr("Alert.Confirm"),tr("Alert.Cancel"));
      }
      
      private function _12831(param1:MouseEvent) : void
      {
         var event:MouseEvent = param1;
         Alert.show(tr("Alert.resetPasswordConfirm"),"",null,function(param1:CloseEvent):void
         {
            if(param1.detail === Alert.FIRST_BUTTON)
            {
               close();
               _12569._1567(new _12475(_12475.SHOW_LOGIN,{
                  "email":_12838,
                  "password":_password
               }));
            }
         },tr("Alert.Confirm"),tr("Alert.Cancel"));
      }
      
      private function _12834(param1:MouseEvent) : void
      {
         this.close();
      }
   }
}

