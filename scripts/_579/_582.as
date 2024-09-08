package _579
{
   import _11106._11105;
   import _11106._11108;
   import _11106._12897;
   import _11111._11110;
   import _1177.UIEvent;
   import _127._142;
   import _1374.Alert;
   import _1404._1407;
   import _346._10604;
   import _586.StageDragController;
   import _6._9;
   import _625._627;
   import _648._665;
   import _772._773;
   import _777._779;
   import _783.CommandNotification;
   import _93._94;
   import _944._10622;
   import _944._946;
   import _97._106;
   import egret.utils.FileUtil;
   import egret.utils.tr;
   import flash.events.MouseEvent;
   import flash.filesystem.File;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   
   public class _582 extends _94
   {
      private var _4944:_946;
      
      private var _4959:File;
      
      private var _4948:String = "http://edn.egret.com/cn/portal/article/index/id/1040";
      
      private var _4967:String = "http://edn.egret.com/cn/portal/article/index/id/893";
      
      private var _10777:String = "http://t.egret.com/work/2-0.html";
      
      public var _10770:Vector.<_665>;
      
      public function _582()
      {
         this._10770 = new Vector.<_665>();
         super();
         this._4959 = File.applicationDirectory.resolvePath("examples");
         if(!this._4959.exists)
         {
            this._4959 = File.applicationDirectory;
            this._4959 = new File(FileUtil.getDirectory(this._4959.nativePath));
            this._4959 = this._4959.resolvePath("doc").resolvePath("examples");
         }
      }
      
      override public function start() : void
      {
         super.start();
         this._4941.welcomePage = this._4944;
      }
      
      override protected function init() : void
      {
      }
      
      override protected function _1576() : void
      {
         var _loc1_:_10622 = null;
         if(this._4944._1890)
         {
            this._4944._10701();
            if(!this._4944._10774)
            {
               this._4944._10780();
            }
            for each(_loc1_ in this._4944._10772)
            {
               _loc1_.addEventListener(MouseEvent.CLICK,this._10768);
            }
            this._4944._4952.addEventListener(MouseEvent.CLICK,this._10767);
            this._4944._4951.addEventListener(MouseEvent.CLICK,this._4939);
            this._4944._4943.addEventListener(MouseEvent.CLICK,this._4939);
            this._4944._4963.addEventListener(MouseEvent.CLICK,this._4940);
            this._4944._4950.addEventListener(MouseEvent.CLICK,this._4940);
            this._4944._4965.addEventListener(MouseEvent.CLICK,this._4940);
            this._4944._4953.addEventListener(MouseEvent.CLICK,this._13885);
            this._4944._10779.addEventListener(MouseEvent.CLICK,this._4940);
            this._4944._10775.addEventListener(MouseEvent.CLICK,this._4940);
            this._4944._10778.addEventListener(MouseEvent.CLICK,this._4940);
            this._4944._6999.addEventListener(MouseEvent.CLICK,this._4940);
            this._4944._4954.addEventListener(MouseEvent.CLICK,this._4940);
            this._4944._4957.addEventListener(MouseEvent.CLICK,this._4933);
            this._4944._4942.addEventListener(MouseEvent.CLICK,this._4933);
            this._4944._4960.addEventListener(MouseEvent.CLICK,this._4933);
            this._4944._13354.addEventListener(MouseEvent.CLICK,this._4933);
            this._4944._4955.addEventListener(MouseEvent.CLICK,this._4933);
            this._4944._4949.addEventListener(MouseEvent.CLICK,this._4933);
            this._4944._11974.addEventListener(MouseEvent.CLICK,this._4933);
            this._4944._11975.addEventListener(MouseEvent.CLICK,this._4933);
            this._4944._10771.addEventListener(MouseEvent.CLICK,this._4933);
            this._4944._4961.addEventListener(MouseEvent.CLICK,this._4933);
            this._4944._4966.addEventListener(MouseEvent.CLICK,this._4933);
            this._4944._10776.addEventListener(MouseEvent.CLICK,this._4933);
            this._4944._6730.addEventListener(MouseEvent.CLICK,this._12958);
         }
         else
         {
            this._4944.addEventListener(UIEvent.CREATION_COMPLETE,this._4930);
         }
      }
      
      override protected function dispose() : void
      {
         var _loc1_:_10622 = null;
         super.dispose();
         for each(_loc1_ in this._4944._10772)
         {
            _loc1_.removeEventListener(MouseEvent.CLICK,this._10768);
         }
         this._4944._4952.removeEventListener(MouseEvent.CLICK,this._10767);
         this._4944._4951.removeEventListener(MouseEvent.CLICK,this._4939);
         this._4944._4943.removeEventListener(MouseEvent.CLICK,this._4939);
         this._4944._4963.removeEventListener(MouseEvent.CLICK,this._4940);
         this._4944._4950.removeEventListener(MouseEvent.CLICK,this._4940);
         this._4944._4965.removeEventListener(MouseEvent.CLICK,this._4940);
         this._4944._4953.removeEventListener(MouseEvent.CLICK,this._13885);
         this._4944._10779.removeEventListener(MouseEvent.CLICK,this._4940);
         this._4944._10775.removeEventListener(MouseEvent.CLICK,this._4940);
         this._4944._6999.removeEventListener(MouseEvent.CLICK,this._4940);
         this._4944._4954.removeEventListener(MouseEvent.CLICK,this._4940);
         this._4944._4957.removeEventListener(MouseEvent.CLICK,this._4933);
         this._4944._4942.removeEventListener(MouseEvent.CLICK,this._4933);
         this._4944._4960.removeEventListener(MouseEvent.CLICK,this._4933);
         this._4944._4955.removeEventListener(MouseEvent.CLICK,this._4933);
         this._4944._4949.removeEventListener(MouseEvent.CLICK,this._4933);
         this._4944._10771.removeEventListener(MouseEvent.CLICK,this._4933);
         this._4944._4961.removeEventListener(MouseEvent.CLICK,this._4933);
         this._4944._4966.removeEventListener(MouseEvent.CLICK,this._4933);
         this._4944._10776.removeEventListener(MouseEvent.CLICK,this._4933);
         this._4944._6730.removeEventListener(MouseEvent.CLICK,this._12958);
      }
      
      private function _12958(param1:MouseEvent) : void
      {
         var _loc2_:URLRequest = new URLRequest(_106.local(_106.VIDEO_TUTORIALS));
         navigateToURL(_loc2_,"_blank");
         _11110.instance._12948._13259(_12897.OfficialVideo,_11108.Launch);
      }
      
      private function _4930(param1:UIEvent) : void
      {
         this._4944.removeEventListener(UIEvent.CREATION_COMPLETE,this._4930);
         this.start();
      }
      
      private function _10768(param1:MouseEvent) : void
      {
         this._10769(_10622(param1.currentTarget)._10773);
      }
      
      private function _10767(param1:MouseEvent) : void
      {
         _11110.instance._11133._11130(_11108.Welcome);
         _1567(new CommandNotification(CommandNotification.SHOW_NEW_PROJECT_WINDOW));
      }
      
      private function _4939(param1:MouseEvent) : void
      {
         var _loc2_:_142 = param1.currentTarget as _142;
         var _loc3_:String = String(_loc2_.userData);
         _11110.instance._11593(_loc3_,_11108.Welcome);
         _1567(new CommandNotification(String(_loc2_.userData)));
      }
      
      public function get _10774() : Boolean
      {
         if(this._4944)
         {
            return this._4944._10774;
         }
         return false;
      }
      
      public function _10780(param1:Function) : void
      {
         if(this._4944)
         {
            this._4944._10780(param1);
         }
      }
      
      public function _10769(param1:String) : void
      {
         var _loc3_:_10604 = null;
         var _loc2_:File = new File(param1);
         if(_loc2_.exists)
         {
            _11110.instance._11652(_11105.Name_OpenRecentProject,_11108.Welcome);
            _1567(new CommandNotification(CommandNotification.OPEN_AND_SELECT_PROJECT,param1));
         }
         else
         {
            _loc3_ = new _10604();
            _loc3_._1572(param1);
            _loc3_.execute();
            this._4944._10701();
            Alert.show(tr("Welcome.openFail"),tr("Welcome.openPrompt"),null,null,tr("Alert.Confirm"));
         }
      }
      
      private function _4933(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this._4944._4957:
               this._12636("Dragon.zip");
               break;
            case this._4944._4942:
               this._12636("DragonOpening.zip");
               break;
            case this._4944._4960:
               this._12636("Ubbie.zip");
               break;
            case this._4944._13354:
               this._12636("FramesAnimation.zip");
               break;
            case this._4944._4955:
               this._12636("Bicycle.zip");
               break;
            case this._4944._4949:
               this._12636("SwordsMan.zip");
               break;
            case this._4944._10771:
               this._4935();
               break;
            case this._4944._4961:
               this._4936();
               break;
            case this._4944._4966:
               this._4938();
               break;
            case this._4944._10776:
               this._10766();
               break;
            case this._4944._11975:
               this._11973();
               break;
            case this._4944._11974:
               this._11972();
         }
      }
      
      private function _4935() : void
      {
         var _loc1_:String = "NewDragon/NewDragon.json";
         var _loc2_:String = "NewDragon/NewDragon.png";
         var _loc3_:String = "NewDragon/NewDragon.atlas";
         this._3227._12635(this._4959.resolvePath(_loc1_).nativePath);
         _779.instance._3276(_779.PARAM_OP,_773.EXAMPLE);
         _11110.instance._11131._11130(_11108.Learn);
      }
      
      private function _4936() : void
      {
         var _loc1_:String = "Demon/Demon.ExportJson";
         var _loc2_:String = "Demon/Demon0.png";
         var _loc3_:String = "Demon/Demon0.plist";
         this._3227._12635(this._4959.resolvePath(_loc1_).nativePath);
         _779.instance._3276(_779.PARAM_OP,_773.EXAMPLE);
         _11110.instance._11131._11130(_11108.Learn);
      }
      
      private function _11972() : void
      {
         var _loc1_:String = "Sheep_Ani.zip";
         this._3227._12635(this._4959.resolvePath(_loc1_).nativePath);
         _779.instance._3276(_779.PARAM_OP,_773.EXAMPLE);
         _11110.instance._11131._11130(_11108.Learn);
      }
      
      private function _11973() : void
      {
         var _loc1_:String = "Rooster_Ani.zip";
         this._3227._12635(this._4959.resolvePath(_loc1_).nativePath);
         _779.instance._3276(_779.PARAM_OP,_773.EXAMPLE);
         _11110.instance._11131._11130(_11108.Learn);
      }
      
      private function _12636(param1:String) : void
      {
         this._3227._12635(this._4959.resolvePath(param1).nativePath);
         _779.instance._3276(_779.PARAM_OP,_773.EXAMPLE);
      }
      
      private function _4931() : void
      {
         var _loc1_:URLRequest = new URLRequest(this._4948);
         navigateToURL(_loc1_,"_blank");
      }
      
      private function _4938() : void
      {
         var _loc1_:URLRequest = new URLRequest(this._4967);
         navigateToURL(_loc1_,"_blank");
      }
      
      private function _10766() : void
      {
         var _loc1_:URLRequest = new URLRequest(this._10777);
         navigateToURL(_loc1_,"_blank");
         _11110.instance._12948._13259(_12897.EgretStore,_11108.Welcome);
      }
      
      private function _4940(param1:MouseEvent) : void
      {
         var _loc2_:_142 = param1.currentTarget as _142;
         _1567(new CommandNotification(CommandNotification.OPEN_URL,String(_loc2_.userData[0])));
         _11110.instance._12948._13259(String(_loc2_.userData[1]),_11108.Welcome);
      }
      
      private function _13885(param1:MouseEvent) : void
      {
         _1567(new _9(CommandNotification.NEWFEATHER_GUIDE));
      }
      
      public function set welcomePage(param1:_946) : void
      {
         if(this._4944 == param1)
         {
            return;
         }
         if(this._4944)
         {
            this.dispose();
         }
         this._4944 = param1;
         if(this._4944)
         {
            if(this._4944)
            {
               this.start();
            }
            else
            {
               this._4944.addEventListener(UIEvent.CREATION_COMPLETE,this._4930);
            }
         }
      }
      
      public function _10701() : void
      {
         if(this._4944)
         {
            this._4944._10701();
         }
      }
      
      private function get _3227() : _627
      {
         return _1407.getInstance(_627) as _627;
      }
      
      private function get _4941() : StageDragController
      {
         return _1407.getInstance(StageDragController) as StageDragController;
      }
   }
}

