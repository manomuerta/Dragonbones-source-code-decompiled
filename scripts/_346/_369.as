package _346
{
   import _1009._1029;
   import _11106._11105;
   import _11106._11108;
   import _11111._11110;
   import _1177.CloseEvent;
   import _1374.Alert;
   import _1404._1407;
   import _521._520;
   import _668._671;
   import _721._762;
   import _93._92;
   import egret.utils.FileUtil;
   import egret.utils.tr;
   import flash.events.Event;
   
   public class _369 extends _92
   {
      public function _369()
      {
         super();
      }
      
      override public function execute() : void
      {
         var beginIndex:int = 0;
         var endIndex:int = 0;
         var onCloseBtnClick:Function = null;
         onCloseBtnClick = function(param1:CloseEvent):void
         {
            var closeProjectCmd:_11494 = null;
            var saveProjectCmd:_365 = null;
            var _3222:_671 = null;
            var vo:_762 = null;
            var _14438:String = null;
            var saveAsWindow:_1029 = null;
            var evt:CloseEvent = param1;
            _3300._3302("\"" + projectPath.substr(beginIndex,endIndex - beginIndex) + "\" " + tr("SaveWindow.content"));
            if(evt.detail == Alert.FIRST_BUTTON)
            {
               if(!_3329._2871.isNew)
               {
                  _11110.instance._11652(_11105.Name_SaveProject,_11108.Close);
                  saveProjectCmd = new _365();
                  saveProjectCmd._1572(_3329);
                  saveProjectCmd.execute();
                  closeProjectCmd = new _11494();
                  closeProjectCmd._1572(projectPath);
                  closeProjectCmd.execute();
               }
               else
               {
                  _3222 = _3329;
                  vo = new _762();
                  vo._10671 = _3222;
                  vo._10705 = true;
                  vo._5603 = true;
                  _14438 = "";
                  _14438 = _2214._3277;
                  vo.ouputPath = _14438;
                  vo.projectName = FileUtil.getFileName(_3329._2871.projectPath);
                  saveAsWindow = new _1029(vo);
                  saveAsWindow.open();
                  saveAsWindow.addEventListener(Event.CLOSE,function(param1:Event):void
                  {
                     _11110.instance._11563._11130(_11108.Close);
                     _11110.instance._11563._11139(_11105.SaveAsProject_IsNew,"1");
                     closeProjectCmd = new _11494();
                     closeProjectCmd.direct = true;
                     closeProjectCmd._1572(projectPath);
                     closeProjectCmd.execute();
                  });
               }
            }
            else if(evt.detail == Alert.SECOND_BUTTON)
            {
               closeProjectCmd = new _11494();
               closeProjectCmd.direct = true;
               closeProjectCmd._1572(projectPath);
               closeProjectCmd.execute();
            }
         };
         if(this._3329 == null)
         {
            return;
         }
         beginIndex = this.projectPath.lastIndexOf("/") + 1;
         endIndex = int(this.projectPath.lastIndexOf("."));
         this._3300._3301("\"" + this.projectPath.substr(beginIndex,endIndex - beginIndex) + "\" " + tr("SaveWindow.content"),tr("SaveWindow.title"),null,onCloseBtnClick,tr("Alert.Yes"),tr("Alert.No"),tr("Alert.Cancel"));
      }
      
      protected function get _3300() : _520
      {
         return _1407.getInstance(_520) as _520;
      }
      
      private function get _3329() : _671
      {
         if(_2223 is _671)
         {
            return _2223 as _671;
         }
         return _2214._1844;
      }
      
      protected function get projectName() : String
      {
         return FileUtil.getFileName(this.projectPath);
      }
      
      protected function get _3280() : String
      {
         return FileUtil.getDirectory(this.projectPath);
      }
      
      protected function get projectPath() : String
      {
         return this._3329.path;
      }
   }
}

