package vieted.com.xpeak.adapter;

import java.util.ArrayList;
import java.util.List;

import vieted.com.xpeak.R;
import vieted.com.xpeak.model.SentenceModel;
import vieted.com.xpeak.widget.AnimatedExpandableListView.AnimatedExpandableListAdapter;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

public class VideoLessionAdapter extends AnimatedExpandableListAdapter {

	private LayoutInflater inflater;

	private List<GroupSentenceItem> items;

	public VideoLessionAdapter(Context context) {

		inflater = LayoutInflater.from(context);
	}

	public void setData(List<GroupSentenceItem> items) {
		this.items = items;
	}

	@Override
	public SentenceModel getChild(int groupPosition, int childPosition) {
		return items.get(groupPosition).getSentenceItems().get(childPosition);
	}

	@Override
	public long getChildId(int groupPosition, int childPosition) {
		return childPosition;
	}

	@Override
	public View getRealChildView(int groupPosition, int childPosition,
			boolean isLastChild, View convertView, ViewGroup parent) {
		ChildHolder holder;
		SentenceModel item = getChild(groupPosition, childPosition);
		if (convertView == null) {
			holder = new ChildHolder();
			convertView = inflater
					.inflate(
							R.layout.item_list_item_expandable_activity_video_introduce_lession,
							parent, false);
			holder.title = (TextView) convertView.findViewById(R.id.textTitle);
			convertView.setTag(holder);
		} else {
			holder = (ChildHolder) convertView.getTag();
		}
		holder.title.setText(item.getText());

		return convertView;
	}

	@Override
	public int getRealChildrenCount(int groupPosition) {
		return items.get(groupPosition).getSentenceItems().size();
	}

	@Override
	public GroupSentenceItem getGroup(int groupPosition) {
		return items.get(groupPosition);
	}

	@Override
	public int getGroupCount() {
		return items.size();
	}

	@Override
	public long getGroupId(int groupPosition) {
		return groupPosition;
	}

	@Override
	public View getGroupView(int groupPosition, boolean isExpanded,
			View convertView, ViewGroup parent) {
		GroupHolder holder;
		GroupSentenceItem item = getGroup(groupPosition);
		if (convertView == null) {
			holder = new GroupHolder();
			convertView = inflater
					.inflate(
							R.layout.item_group_expandable_activity_video_introduce_lesson,
							parent, false);
			holder.tvTitle = (TextView) convertView
					.findViewById(R.id.textTitle);

			convertView.setTag(holder);

		} else {
			holder = (GroupHolder) convertView.getTag();
		}

		holder.tvTitle.setText(item.title);

		return convertView;
	}

	@Override
	public boolean hasStableIds() {
		return true;
	}

	@Override
	public boolean isChildSelectable(int arg0, int arg1) {
		return true;
	}

	public static class GroupSentenceItem {
		public String title;
		private List<SentenceModel> sentenceItems = new ArrayList<SentenceModel>();

		public List<SentenceModel> getSentenceItems() {
			return sentenceItems;
		}

		public void setSentenceItems(List<SentenceModel> sentenceItems) {
			this.sentenceItems = sentenceItems;
		}
	}

	private static class ChildHolder {
		TextView title;
	}

	private static class GroupHolder {
		TextView tvTitle;
	}

}
