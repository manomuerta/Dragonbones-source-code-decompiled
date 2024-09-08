package _625
{
   import _1009._1031;
   import _1177.UIEvent;
   import _1374.Alert;
   import _1404._1407;
   import _472._12461;
   import _477.ExportController;
   import _648._12463;
   import _721._720;
   import _783.TipNotification;
   import _783._12475;
   import _93._94;
   import egret.utils.tr;
   import flash.utils.ByteArray;
   
   public class _635 extends _94
   {
      private static const MAX_FILE_SIZE:int = 20000000;
      
      private static const WARN_FILE_SIZE:int = 10000000;
      
      private var window:_1031;
      
      private var _5614:Number;
      
      public function _635()
      {
         this._12594 = _1407.getInstance(_12463);
         super();
      }
      
      public function _3155() : void
      {
         if(this._12594._3766)
         {
            this._5616();
         }
         else
         {
            _1567(new _12475(_12475.SHOW_LOGIN,this._5616));
         }
      }
      
      private function _5616() : void
      {
         if(Boolean(_2214) && Boolean(_2214._1844))
         {
            this.window = new _1031(_2214._1844.path);
            this.window.addEventListener(UIEvent.CREATION_COMPLETE,this._5481);
            this.window.callback = this._5615;
            this.window.open();
         }
         else
         {
            _1567(new TipNotification(TipNotification.TIP_ALERT,tr("Share.noProject")));
         }
      }
      
      protected function _5481(param1:UIEvent) : void
      {
      }
      
      private function _5615(param1:Object) : void
      {
         var _3238:_720;
         var info:Object = param1;
         if(info.desc == null || info.desc == "")
         {
            info.desc = "no describe";
         }
         _3238 = new _720();
         _3238.dragonBonesVO = _2214._1844._2871.dragonBonesVO;
         _3238.projectName = info.projectName;
         _3238.scale = 1;
         _3238.dataType = _720.DATA_TYPE_JSON;
         this.window.sending = true;
         this._3602._3621(_3238,function(param1:ByteArray, param2:String):void
         {
            var zipbyte:ByteArray = param1;
            var htmlData:String = param2;
            _13004._13366(info.projectName,info.desc,info.desc,info.attachmentContent,zipbyte,htmlData,function(param1:Boolean, param2:Object):void
            {
               if(param1)
               {
                  onComplete(param2);
               }
               else
               {
                  onError();
               }
            });
         });
      }
      
      private function get _3602() : ExportController
      {
         return _1407.getInstance(ExportController) as ExportController;
      }
      
      private function get _13004() : _12461
      {
         return _1407.getInstance(_12461) as _12461;
      }
      
      private function onError() : void
      {
         if(this._5614 > WARN_FILE_SIZE)
         {
            Alert.show(tr("Share.fail.size"));
         }
         else
         {
            Alert.show(tr("Share.fail"));
         }
         this.window.sending = false;
      }
      
      private function onComplete(param1:Object) : void
      {
         Alert.show(tr("Share.success"));
         this.window.close();
      }
   }
}

