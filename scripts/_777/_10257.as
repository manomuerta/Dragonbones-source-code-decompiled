package _777
{
   import _10264._10263;
   import _1404._1407;
   import _1529._1528;
   import _2._4;
   import _6.Context;
   import _639._638;
   import _648._12463;
   import egret.utils.FileUtil;
   import egret.utils._1501;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.events.TimerEvent;
   import flash.net.URLRequest;
   import flash.net.URLRequestHeader;
   import flash.net.URLRequestMethod;
   import flash.system.Capabilities;
   import flash.utils.Timer;
   
   public class _10257 extends _780
   {
      private var _projectData:_10255;
      
      public function _10257(param1:Object, param2:_10255)
      {
         this._12594 = _1407.getInstance(_12463);
         super(param1);
         this._projectData = param2;
      }
      
      override public function run() : void
      {
         var _loc1_:String = this.getData();
         _10263.instance._10392(_loc1_,this._10393);
      }
      
      private function _10393(param1:String) : void
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:URLRequest = null;
         var _loc5_:Array = null;
         _5981 = _779.instance.urlLoader;
         if(_5981)
         {
            _5981.addEventListener(IOErrorEvent.IO_ERROR,onError);
            _5981.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onError);
            _5981.addEventListener(Event.COMPLETE,this.onComplete);
            _loc2_ = param1;
            _loc3_ = _779._10390;
            (_loc4_ = new URLRequest(_loc3_)).method = URLRequestMethod.POST;
            _loc5_ = new Array(new URLRequestHeader("Content-Type","application/x-www-form-urlencoded;"));
            _loc4_.data = "data=" + _loc2_;
            _5981.load(_loc4_);
            _5980 = new Timer(_779.OVER_TIME,1);
            _5980.addEventListener(TimerEvent.TIMER_COMPLETE,_5388);
            _5980.start();
         }
      }
      
      override protected function getData() : String
      {
         var projectName:String;
         _data.PName = _4.SOFT_NAME;
         _data.OS = Capabilities.os;
         _data.OS_ver = Capabilities.version;
         _data.uid = this._12594.uid;
         _data.uuid = this._12594._12691;
         if(_data.uid == null)
         {
            _data.uid = _data.uuid;
         }
         projectName = "";
         try
         {
            projectName = (Context.getInstance()._1568.appModel as _638)._1844._2871.projectPath;
         }
         catch(e:Error)
         {
            projectName = "noProject";
         }
         _data._10368 = projectName;
         _data.toolsLang = _1528.language;
         _data.ver = _1501.currentVersion + _1501.currentVersionLabel;
         _data.installtime = "";
         _data.pid = "";
         return JSON.stringify(_data);
      }
      
      override protected function onComplete(param1:Event) : void
      {
         this.deleteFile();
         super.onComplete(param1);
      }
      
      private function deleteFile() : void
      {
         if(this._projectData)
         {
            FileUtil.deletePath(this._projectData.dataSavePath);
            this._projectData.dataSavePath = null;
            this._projectData.dataLastEditTime = 0;
         }
      }
   }
}

